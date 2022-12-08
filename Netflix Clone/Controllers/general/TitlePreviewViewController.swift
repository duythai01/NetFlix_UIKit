//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by Apple on 28/07/2022.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {

    private let labelTitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry Potter"
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = " This is the best movie for kid"
        return label
    }()
    
    private let downloadBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("DownLoad", for: .normal)
        btn.backgroundColor = .red
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = true
        return btn
        
    }()
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        view.addSubview(labelTitle)
        view.addSubview(overviewLabel)
        view.addSubview(downloadBtn)
        
        configureConstraints()
    }
    
    func configureConstraints(){
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
//            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 250),
       
        ]
        
        let labelTitleConstraints = [
            labelTitle.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        
        let overviewLableConstraints = [
            overviewLabel.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let downloadBtnConstraints = [
            downloadBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadBtn.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 25),
            webView.heightAnchor.constraint(equalToConstant: 40),
            webView.widthAnchor.constraint(equalToConstant: 160)
        ]
        
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(labelTitleConstraints)
        NSLayoutConstraint.activate(overviewLableConstraints)
        NSLayoutConstraint.activate(downloadBtnConstraints)
    }
    
    func configure (with model: TitlePreviewModel){
        labelTitle.text = model.title
        overviewLabel.text = model.titleOverview
        
        guard let url = URL(string: "https://www.youtube.com/watch?v=\(model.youtubeView.id.videoId)") else { return }
        webView.load(URLRequest(url: url))
    }

}
