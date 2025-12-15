//
//  YouTubeView.swift
//  FoodOrder
//
//  Created by Arvinth Manivasakan on 03/06/25.
//

import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    
    let videoId: String
    
    
    func makeUIView(context: Context) -> WKWebView {
        let webV = WKWebView()
        webV.configuration.allowsInlineMediaPlayback = true
        webV.configuration.allowsPictureInPictureMediaPlayback = true
        webV.configuration.mediaTypesRequiringUserActionForPlayback = []
        return webV
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoId)?playsinline=1") else {
            return
        }
        
        let request = URLRequest(url: url)
        
        uiView.load(request)
    }
}
