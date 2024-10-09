//
//  ValuesTableViewCell.swift
//  CurrencyQuotationApp
//
//  Created by Espezzialy Souza on 09/10/24.
//

import UIKit

class ValuesTableViewCell: UITableViewCell {
    static let identifier: String = "DailyForecast"
    private lazy var anthemImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "brazilAnthem")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var realLabel: UILabel = {
       let label = UILabel()
        label.text = "BRL"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = UIColor.purpleColor
        return label
    }()
    
    private lazy var valueRealLabel: UILabel = {
        let label = UILabel()
        label.text = "736.70"
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        return label
    }()

        private lazy var stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [anthemImage,
                                                          realLabel,
                                                          valueRealLabel])
            stackView.axis = .horizontal
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.isLayoutMarginsRelativeArrangement = true
            stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16,
                                                                         leading: 16,
                                                                         bottom: 16,
                                                                         trailing: 16)
            stackView.spacing = 15
            return stackView
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setUpView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setUpView(){
            backgroundColor = .clear
            selectionStyle = .none
            setHierarchy()
            setConstrainsts()
        }
        
        private func setHierarchy(){
            contentView.addSubview(stackView)
        }
        
        private func setConstrainsts(){
            NSLayoutConstraint.activate([
                
            ])
        }

}
