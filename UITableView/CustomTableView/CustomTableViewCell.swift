//
//  CustomTableViewCell.swift
//  UITableView
//
//  Created by Serikzhan on 08.03.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var person: Person? {
        didSet {
            personImage.image = person?.photoImage
            countryImage.image = person?.countryImage
            name.text = person?.name
            profession.text = person?.profession.rawValue
        }
    }
    
    // MARK: - Outlets
    
    private let personImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let countryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(systemName: "person")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "Serikzhan"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let profession: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.text = "Serikzhan"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    // MARK: - Setup
    
    private func setupHierarchy() {
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(profession)
        imageContainer.addSubview(personImage)
        imageContainer.addSubview(countryImage)
        contentView.addSubview(stack)
        contentView.addSubview(imageContainer)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            imageContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            
            personImage.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            personImage.leftAnchor.constraint(equalTo: imageContainer.leftAnchor),
            
            countryImage.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            
            
            //imageContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            
            stack.leftAnchor.constraint(equalTo: imageContainer.centerXAnchor)
            
            
            //            personImage.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            //            personImage.rightAnchor.constraint(equalTo: imageContainer.rightAnchor),
            //            personImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor),
            //            personImage.leftAnchor.constraint(equalTo: imageContainer.leftAnchor),
            //            personImage.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            //
            //            countryImage.rightAnchor.constraint(equalTo: imageContainer.rightAnchor),
            //            countryImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor),
            //            countryImage.heightAnchor.constraint(equalToConstant: 20),
            //            countryImage.widthAnchor.constraint(equalToConstant: 20),
            //
            //            imageContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            //            imageContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            //            imageContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            //            imageContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            //            imageContainer.widthAnchor.constraint(equalToConstant: 60),
            //            imageContainer.heightAnchor.constraint(equalToConstant: 60),
            //
            //            stack.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
            //            stack.leftAnchor.constraint(equalTo: imageContainer.rightAnchor, constant: 20)
            
            
            
            //            personImage.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: -3),
            //            personImage.leftAnchor.constraint(equalTo: imageContainer.leftAnchor, constant: 3),
            //          //  personImage.rightAnchor.constraint(equalTo: imageContainer.rightAnchor),
            //           // personImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor),
            //
            //            countryImage.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 20),
            //            countryImage.leftAnchor.constraint(equalTo: imageContainer.leftAnchor, constant: 3),
            //            //countryImage.rightAnchor.constraint(equalTo: imageContainer.rightAnchor),
            //            //countryImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor),
            //            countryImage.widthAnchor.constraint(equalToConstant: 20),
            //            countryImage.heightAnchor.constraint(equalToConstant: 20),
            //
            //            imageContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            //            imageContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            //            //imageContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            //            imageContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            //            imageContainer.widthAnchor.constraint(equalToConstant: 60),
            //            imageContainer.heightAnchor.constraint(equalToConstant: 60),
            //
            //            stack.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
            //            stack.leftAnchor.constraint(equalTo: imageContainer.rightAnchor, constant: 20)
            
            
        ])
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.person = nil
    }
}
