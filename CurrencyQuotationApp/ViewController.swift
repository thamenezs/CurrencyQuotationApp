//
//  ViewController.swift
//  CurrencyQuotationApp
//
//  Created by Espezzialy Souza on 09/10/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
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
    
    private lazy var valuesStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [valueTitle, converterValueStackView, valueRealTitle, convertedValueStackView])
            stackView.axis = .vertical
        stackView.spacing = 16
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.backgroundColor = UIColor.white
            stackView.layer.cornerRadius = 20
            stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16)
            return stackView
        }()
    
    private lazy var converterValueStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [anthemImage,
                                                       countryLabel,
                                                       setValueLabel
                                                    ])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var valueTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Valor"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.grayColor
        return label
    }()
    
    private lazy var anthemImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sgd")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var countryLabel: UILabel = {
       let label = UILabel()
        label.text = "SGD"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = UIColor.purpleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var setValueLabel: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
            textField.placeholder = "1"
            textField.delegate = self
            textField.keyboardType = .decimalPad
            textField.backgroundColor = .clear
            textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
        
    private lazy var convertedValueStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [brazilImage,
                                                       realLabel,
                                                       valueRealLabel])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var valueRealTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Valor em Real"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.grayColor
        return label
    }()
    
    private lazy var brazilImage: UIImageView = {
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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.purpleColor
        return label
    }()
    
    private lazy var valueRealLabel: UILabel = {
        let label = UILabel()
        label.text = "736.70"
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        return label
    }()
    
    private lazy var separator: UIView = {
       let separator = UIView()
        separator.backgroundColor = UIColor.grayColor
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private lazy var countriesCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: 136, height: 104)
            layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.backgroundColor = .clear
            collectionView.dataSource = self
            collectionView.register(CountriesCollectionViewCell.self, forCellWithReuseIdentifier: CountriesCollectionViewCell.identifier)
        collectionView.allowsSelection = true
            return collectionView
        }()
    
    
    private lazy var indicateLabel: UILabel = {
       let label = UILabel()
        label.text = "Valor indicativo"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.grayColor
        return label
    }()
    
    private lazy var indicateValueLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    private var dolarToReal: String?

    private let service = Service()

    private var currencyResponse: CurrencyResponse?
        
    override func viewDidLoad() {
            super.viewDidLoad()
            setupView()
            fetchData()

        }
    
    private func fetchData(){
        service.fetchData() { [weak self] response in
            self?.currencyResponse = response
            DispatchQueue.main.async{
                self?.loadData()
            }
            
        }
    }
        
    private func loadData(){
        if let usDollarData = currencyResponse?["USDBRL"] {
            dolarToReal = usDollarData.bid
            indicateValueLabel.text = "1 USD = \(dolarToReal ?? "N/A") BRL"
        }
        countriesCollectionView.reloadData()
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
        view.addSubview(valuesStackView)
        view.addSubview(separator)
        view.addSubview(countriesCollectionView)
        view.addSubview(indicateLabel)
        view.addSubview(indicateValueLabel)
    }
    
    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            // Constraints do título
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            // Constraints do subtítulo
            subtittleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            subtittleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subtittleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            subtittleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            // Constraints da Stack View principal
            valuesStackView.heightAnchor.constraint(equalToConstant: 268),
            valuesStackView.widthAnchor.constraint(equalToConstant: 320),
            valuesStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            valuesStackView.topAnchor.constraint(equalTo: subtittleLabel.bottomAnchor, constant: 40),

            // Constraints das imagens
            brazilImage.heightAnchor.constraint(equalToConstant: 45),
            brazilImage.widthAnchor.constraint(equalToConstant: 45),
            anthemImage.heightAnchor.constraint(equalToConstant: 45),
            anthemImage.widthAnchor.constraint(equalToConstant: 45),

            // Constraints do separador (dentro da stack)
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.leadingAnchor.constraint(equalTo: valuesStackView.leadingAnchor, constant: 10),
            separator.trailingAnchor.constraint(equalTo: valuesStackView.trailingAnchor, constant: -10),

            // Constraints das stacks internas de converter
            valueTitle.heightAnchor.constraint(equalToConstant: 18),
            valueTitle.topAnchor.constraint(equalTo: valuesStackView.topAnchor, constant: 20),
            converterValueStackView.topAnchor.constraint(equalTo: valueTitle.bottomAnchor, constant: 14),
            converterValueStackView.leadingAnchor.constraint(equalTo: valuesStackView.leadingAnchor, constant: 16),
            converterValueStackView.trailingAnchor.constraint(equalTo: valuesStackView.trailingAnchor, constant: -16),
            
            // Constraints para o separador
            separator.topAnchor.constraint(equalTo: converterValueStackView.bottomAnchor, constant: 30),

            // Constraints das stacks internas de valor em real
            valueRealTitle.heightAnchor.constraint(equalToConstant: 18),
            valueRealTitle.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 30),
            convertedValueStackView.topAnchor.constraint(equalTo: valueRealTitle.bottomAnchor, constant: 14),
            convertedValueStackView.leadingAnchor.constraint(equalTo: valuesStackView.leadingAnchor, constant: 16),
            convertedValueStackView.trailingAnchor.constraint(equalTo: valuesStackView.trailingAnchor, constant: -16),
            
            countriesCollectionView.topAnchor.constraint(equalTo: valuesStackView.bottomAnchor, constant: 24),
                    countriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    countriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    countriesCollectionView.heightAnchor.constraint(equalToConstant: 120),
            
            indicateLabel.heightAnchor.constraint(equalToConstant: 19),
            indicateLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            indicateLabel.leadingAnchor.constraint(equalTo: valuesStackView.leadingAnchor),
            
            indicateValueLabel.heightAnchor.constraint(equalToConstant: 21),
            indicateValueLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            indicateValueLabel.leadingAnchor.constraint(equalTo: valuesStackView.leadingAnchor),
        ])
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            print("Valor digitado: \(value)")
        }
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        currencyResponse?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountriesCollectionViewCell.identifier, for: indexPath) as? CountriesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let currencyResponse else {
            return cell
        }
        let currencyKeys = Array(currencyResponse.keys)
        
        guard indexPath.item < currencyKeys.count else {
            return cell
        }
        
        let currencyKey = currencyKeys[indexPath.item]
        let currencyData = currencyResponse[currencyKey]
        let originalName = currencyData?.name ?? ""
        let shortName = originalName.split(separator: "/").first?.trimmingCharacters(in: .whitespacesAndNewlines) ?? originalName
        let countryName: String?
        let countryImage: String?
        
        switch shortName {
        case "Euro":
            countryName = "EUR"
            countryImage = "eur"
            
        case "Dólar Americano":
            countryName = "USD"
            countryImage = "usd"
        
        case "Peso Argentino":
            countryName = "ARS"
            countryImage = "ars"
        default:
            countryName = "BRL"
            countryImage = "brl"
        }
        cell.loadData(coinName: shortName, countryImage: countryImage, countryName: countryName)
        return cell
    }
}
