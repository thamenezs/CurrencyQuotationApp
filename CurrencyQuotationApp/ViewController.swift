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
    
    private lazy var subtittleLabel: UILabel = {
       let subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.text = "Selecione a moeda e a quantidade que será convertida"
        subtitle.font = UIFont.systemFont(ofSize: 16)
        subtitle.textColor = UIColor.grayColor
        subtitle.textAlignment = .center
        subtitle.numberOfLines = 2
        return subtitle
        
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
        view.backgroundColor = UIColor.backgroundGray
        view.addSubview(titleLabel)
        view.addSubview(subtittleLabel)
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            subtittleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            subtittleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subtittleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

}

