//
//  ChatBarViewModel.swift
//  chatbar
//
//  Created by devon jerothe on 9/19/23.
//

import Foundation

class WebViewModel: ObservableObject {
    @Published var selectedUrl: String = "https://chat.openai.com"
    @Published var userAgent: String = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62"
}
