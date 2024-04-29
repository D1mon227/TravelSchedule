import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String
    @Binding var progress: Double
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.addObserver(context.coordinator,
                            forKeyPath: #keyPath(WKWebView.estimatedProgress),
                            options: .new,
                            context: nil)
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            uiView.load(URLRequest(url: url))
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(webView: WKWebView(), progress: $progress)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var webView: WKWebView?
        @Binding var progress: Double
        
        init(webView: WKWebView? = nil, progress: Binding<Double>) {
            self.webView = webView
            _progress = progress
        }
        
        deinit {
            webView?.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
        }
        
        override func observeValue(forKeyPath keyPath: String?,
                                   of object: Any?,
                                   change: [NSKeyValueChangeKey : Any]?,
                                   context: UnsafeMutableRawPointer?) {
            guard keyPath == #keyPath(WKWebView.estimatedProgress),
                  let newValue = change?[.newKey] as? Double else { return }
            progress = newValue
        }
    }
}
