import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        WebsiteView()
            .ignoresSafeArea(edges: .bottom)
            .background(Color(red: 12/255, green: 12/255, blue: 13/255))
    }
}

struct WebsiteView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: .zero)
        webView.isOpaque = false
        webView.backgroundColor = UIColor(red: 12/255, green: 12/255, blue: 13/255, alpha: 1)
        webView.scrollView.backgroundColor = webView.backgroundColor
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        if let fileURL = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL.deletingLastPathComponent())
        } else {
            webView.loadHTMLString("<html><body style='background:#0c0c0d;color:white;font-family:sans-serif;padding:24px'><h1>Asthelix Digital Media</h1><p>Website file is missing from this build.</p></body></html>", baseURL: nil)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
