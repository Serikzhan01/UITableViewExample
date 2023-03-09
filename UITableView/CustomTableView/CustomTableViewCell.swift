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
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let countryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 11
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let profession: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
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
        contentView.addSubview(imageContainer)
        contentView.addSubview(stack)
        
        imageContainer.addSubview(personImage)
        imageContainer.addSubview(countryImage)
        
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(profession)
    }
    
    private func setupLayout() {
        // imagecontainer
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageContainer.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
        // stack
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: 100),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        // personImage
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            personImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: -470),
            personImage.heightAnchor.constraint(equalToConstant: 60),
        ])
        // countryPerson
        NSLayoutConstraint.activate([
            countryImage.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 60),
            countryImage.leadingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: 60),
            countryImage.heightAnchor.constraint(equalToConstant: 25),
            countryImage.widthAnchor.constraint(equalToConstant: 25)
        ])
        
       //  MARK: - Reuse
             func prepareForReuse() {
                super.prepareForReuse()
                self.accessoryType = .none
                self.person = nil
            }
    }
}
