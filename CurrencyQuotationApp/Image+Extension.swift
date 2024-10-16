//
//  Image+Extension.swift
//  CurrencyQuotationApp
//
//  Created by Espezzialy Souza on 09/10/24.
//

import Foundation
import UIKit

extension UIView {
    
    public func createCountryView(image: String, name: String) -> (view: UIView, label: UILabel){
        
          let anthemImage: UIImageView = {
           let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "\(image)")
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
         let countryLabel: UILabel = {
           let label = UILabel()
            label.text = name
            label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            label.textColor = UIColor.purpleColor
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let stackView = UIStackView(arrangedSubviews: [anthemImage, countryLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            anthemImage.heightAnchor.constraint(equalToConstant: 45),
            anthemImage.widthAnchor.constraint(equalToConstant: 45)
        ])
        
        return (stackView, countryLabel)
    }
}
