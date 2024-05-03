import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String
    @ObservedObject var viewModel: ProgressViewModel
    private let webView = WKWebView()
    
    func makeUIView(context: Context) -> WKWebView {
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, viewModel: viewModel)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        private var parent: WebView
        private var viewModel: ProgressViewModel
        private var observer: NSKeyValueObservation?
        
        init(parent: WebView, viewModel: ProgressViewModel) {
            self.parent = parent
            self.viewModel = viewModel
            super.init()
            
            self.observer = self.parent.webView.observe(\.estimatedProgress) { [weak self] webView, _ in
                guard let self else { return }
                self.parent.viewModel.progress = parent.webView.estimatedProgress
            }
        }
        
        deinit {
            observer?.invalidate()
        }
    }
}

extension WebView {
    class ProgressViewModel: ObservableObject {
        @Published var progress: Double = 0.0
        
        init(progress: Double) {
            self.progress = progress
        }
    }
}
