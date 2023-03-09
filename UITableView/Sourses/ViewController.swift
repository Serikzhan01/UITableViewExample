//
//  ViewController.swift
//  UITableView
//
//  Created by Serikzhan on 08.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var names = ["Andrew", "Sayan", "Karim", "Alen", "Marat", "Ivan", "Syrym", "Almat", "Kirill", "Serikzhan"]
    
    private var symbols = ["star", "star", "star", "star", "star", "star", "star", "star", "star", "star"]
    
    // MARK: - Outlets
    
    private lazy var addNameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .systemGray
        textField.textAlignment = .center
        textField.placeholder = "Type name here.."
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 20
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var addNameButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemBlue
        button.setTitle("Press to add", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(addNameButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Table View"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(tableView)
        view.addSubview(addNameTextField)
        view.addSubview(addNameButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            addNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addNameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250),
            addNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            addNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            addNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            addNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addNameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180),
            addNameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            addNameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            addNameButton.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: addNameButton.bottomAnchor, constant: 30),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func addNameButtonPressed() {
        print("addName button pressed")
        if addNameTextField.text != "" {
            names.append(addNameTextField.text ?? "")
            print(names.count)
        } else {
            let alert = UIAlertController(title: "Nothing was written",
                                          message: "Please, enter the name in textField",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"ok",
                                          style: .cancel))
            self.present(alert, animated: true)
        }
        tableView.reloadData()
    }
}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        //let images = symbols.map { UIImage(systemName: $0) }
        //let image = images[indexPath.row]
       // cell.imageView?.image = image
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

