//
//  ViewController.swift
//  CurrencyQuotationApp
//
//  Created by Espezzialy Souza on 09/10/24.
//

import UIKit

class ViewController: UIViewController {

    
    private lazy var titleLabel:UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Converter para Real"
        title.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        title.textColor = UIColor.purpleColor
        title.textAlignment = .center
        return title
    }()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setupView()

        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
        }
    
    private func setupView(){
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        view.backgroundColor = .white
        view.addSubview(titleLabel)
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
        ])
    }

}

