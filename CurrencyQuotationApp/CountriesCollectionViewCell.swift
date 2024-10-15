//
//  CountriesCollectionViewCell.swift
//  CurrencyQuotationApp
//
//  Created by Espezzialy Souza on 09/10/24.
//

import UIKit

class CountriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "Countries"
    
    
    private lazy var coinLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var countryView: UIView = {
       return createCountryView(image: "", name: "")
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [coinLabel, countryView])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 15, leading: 12, bottom: 15, trailing: 12)
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setUpView()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
        
        private func setUpView(){
            setHierarchy()
            setConstraints()
        }
        
        private func setHierarchy(){
            contentView.addSubview(stackView)
            
        }
        private func setConstraints(){
            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .zero),
                stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                
                coinLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 15),
                coinLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 12)
            ])
        }
    
    func loadData(coinName: String?, countryImage: String?, countryName: String?){
        coinLabel.text = coinName
        
        let newCountryView = createCountryView(image: countryImage ?? "", name: countryName ?? "")
        
        stackView.removeArrangedSubview(countryView)
        countryView.removeFromSuperview()
        
        countryView = newCountryView
        stackView.addArrangedSubview(countryView)
        
    }
    }
