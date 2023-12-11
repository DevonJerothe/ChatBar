//
//  ContentView.swift
//  chatbar
//
//  Created by devon jerothe on 9/19/23.
//

import SwiftUI
import WebKit

struct ChatBarWindow: View {
    @StateObject var viewModel: WebViewModel = WebViewModel()

    var body: some View {
        VStack {
            // TopBar
            tabBar
            // WebView
            ChatBarWebView(viewModel: viewModel)
        }
    }

    var tabBar: some View {
        HStack {
            Button(action: {
                viewModel.selectedUrl = "https://chat.openai.com"
            }, label: {
                Text("Chat GPT")
            })
            Button(action: {
                viewModel.selectedUrl = "https://bard.google.com/chat"
                
            }, label: {
                Text("Bard")
            })
            Button(action: {
                viewModel.selectedUrl = "https://claude.ai/"
                
            }, label: {
                Text("Claude AI")
            })
            Button(action: {
                viewModel.selectedUrl = "https://www.bing.com/search?q=Bing+AI&showconv=1&FORM=hpcodx"

            }, label: {
                Text("Bing Chat")
            })
            Spacer()
            Button(action: {
                NSApplication.shared.terminate(self)
            }, label: {
                Image(systemName: "x.circle.fill")
            })
        }
        .padding(6)
    }
}

struct ChatBarWebView: NSViewRepresentable {
    @ObservedObject var viewModel: WebViewModel

    func makeNSView(context: Context) -> WKWebView {
        let request = URLRequest(url: URL(string: viewModel.selectedUrl)!)
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator as? WKUIDelegate
        webView.customUserAgent = viewModel.userAgent
        webView.load(request)
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        let request = URLRequest(url: URL(string: viewModel.selectedUrl)!)
        nsView.customUserAgent = viewModel.userAgent
        nsView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }
    }
}

#Preview {
    ChatBarWindow()
}
