//
//  DetailViewController.swift
//  UITableView
//
//  Created by Serikzhan on 10.03.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var person: Person?
    
    // MARK: - Outlets
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 125
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let profession: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupHierarchy()
        setupLayout()
        fillSettings()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        stack.addArrangedSubview(profession)
        stack.addArrangedSubview(countryImage)
        view.addSubview(stack)
       
        view.addSubview(imageView)
        view.addSubview(label)
//        view.addSubview(profession)
//        view.addSubview(countryImage)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 50),
            label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            stack.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            stack.heightAnchor.constraint(equalToConstant: 30),
            stack.leadingAnchor.constraint(equalTo: imageView.leadingAnchor)
        ])
        
        
//
//        NSLayoutConstraint.activate([
//            profession.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            profession.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
//            profession.leadingAnchor.constraint(equalTo: label.leadingAnchor),
//          //  profession.widthAnchor.constraint(equalToConstant: 200)
//        ])
////
//        NSLayoutConstraint.activate([
//            countryImage.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
//            countryImage.trailingAnchor.constraint(equalTo: profession.trailingAnchor),
//            countryImage.heightAnchor.constraint(equalToConstant: 20),
//            countryImage.widthAnchor.constraint(equalToConstant: 20)
//        ])
    }
    
    private func fillSettings() {
        imageView.image = person?.photoImage
        label.text = person?.name
        countryImage.image = person?.countryImage
        profession.text = "\(person?.profession.rawValue ?? "") from"
    }
    
}
