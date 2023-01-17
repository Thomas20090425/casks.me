//
//  ViewController.swift
//  Thomas的家
//
//  Created by 马悦程 on 2023-01-15.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    
    @IBOutlet weak var webView: WKWebView!

    @IBOutlet weak var Actint: UIActivityIndicatorView!

    @IBOutlet weak var text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://casks.me")
        let request = URLRequest(url: url!)
        
        webView.load(request)
        
        webView.addSubview(Actint)
        Actint.startAnimating()
        webView.navigationDelegate = self
        Actint.hidesWhenStopped = true
    }
    
    
    @IBAction func back(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
            
        }
    }
    
    @IBAction func forward(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func Stop(_ sender: Any) {
        webView.stopLoading()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        Actint.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Actint.stopAnimating()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        Actint.stopAnimating()
    }
}

