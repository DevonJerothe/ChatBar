//
//  chatbarApp.swift
//  chatbar
//
//  Created by devon jerothe on 9/19/23.
//

import SwiftUI

@main
struct chatbarApp: App {

    @StateObject var viewModel = WebViewModel()

    var body: some Scene {
        MenuBarExtra("ChatBar", systemImage: "bubble.left.and.bubble.right") {
            ChatBarWindow()
                .frame(width: 900, height: 700)
        }
        .menuBarExtraStyle(.window)
    }
}
