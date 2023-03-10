//
//  BestTeamViewController.swift
//  UITableView
//
//  Created by Serikzhan on 08.03.2023.
//

import UIKit

class BestTeamViewController: UIViewController {

    private var persons: [[Person]]?
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        persons = Person.persons
        view.backgroundColor = .systemBlue
        title = "Best Team"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension BestTeamViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return persons?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        cell?.person = persons?[indexPath.section][indexPath.row]
        cell?.accessoryType = .detailDisclosureButton
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        tableView.deselectRow(at: indexPath, animated: true)
        viewController.person = persons?[indexPath.section][indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            persons?[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! HeaderView

        switch section {
        case 0:
            view.label.text = "SEOs"
            view.imageView.image = UIImage(systemName: "crown")
            return view
        case 1:
            view.label.text = "Product Managers"
            view.imageView.image = UIImage(systemName: "brain.head.profile")
            return view
        case 2:
            view.label.text = "Project Managers"
            view.imageView.image = UIImage(systemName: "message")
            return view
        case 3:
            view.label.text = "Backend developers"
            view.imageView.image = UIImage(systemName: "shippingbox")
            return view
        case 4:
            view.label.text = "iOS Developers"
            view.imageView.image = UIImage(systemName: "swift")
            return view
        case 5:
            view.label.text = "Android Developer"
            view.imageView.image = UIImage(systemName: "camera.macro.circle")
            return view
        case 6:
            view.label.text = "Frontend developers"
            view.imageView.image = UIImage(systemName: "display")
            return view
        case 7:
            view.label.text = "Designers"
            view.imageView.image = UIImage(systemName: "paintpalette")
            return view
        default:
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Our SEOs is she best generalists in the world!"
        case 1:
            return "Product managers promote our product to the world market!"
        case 2:
            return "Project managers monitors everyone, distributes tasks and controls processes"
        case 3:
            return "Backenders make some strange things that all work!"
        case 4:
            return "iOS-Developers make awesome application for iOS system on iPhone!"
        case 5:
            return "Android-Developers make awesome application for Android system on different devices!"
        case 6:
            return "Frontend developers make out site code more intelligent!"
        case 7:
            return "Designers make our application and site design is awesome!"
        default:
            return "ERROR"
        }
    }
    
}

