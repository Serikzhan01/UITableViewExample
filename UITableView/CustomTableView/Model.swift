//
//  Model.swift
//  UITableView
//
//  Created by Serikzhan on 08.03.2023.
//

import UIKit

enum Professions: String {
    case seo = "SEO"
    case product = "Product Manager"
    case project = "Project Manager"
    case backend = "Backend Developer"
    case iOS = "iOS Developer"
    case android = "Android Developer"
    case frontend = "Frontend Developer"
    case designer = "Designer"
}

struct Person: Hashable {
    var photoImage: UIImage
    var name: String
    var profession: Professions
    var countryImage: UIImage
}

extension Person {
    static var persons: [[Person]] = [
        // Seos
        [Person(photoImage: UIImage(named: "person1")!, name: "Philips Nataly", profession: .seo, countryImage: UIImage(named: "1")!)],
        // Product Managers
        [Person(photoImage: UIImage(named: "person2")!, name: "Serj Estimoza", profession: .product, countryImage: UIImage(named: "2")!)],
        // Project Managers
        [Person(photoImage: UIImage(named: "person3")!, name: "Jack Whilde", profession: .project, countryImage: UIImage(named: "3")!)],
        // Backend Developer
        [Person(photoImage: UIImage(named: "person4")!, name: "Lisa Coulman", profession: .backend, countryImage: UIImage(named: "4")!)],
        // iOS Developers
        [Person(photoImage: UIImage(named: "person5")!, name: "Jane Foster", profession: .iOS, countryImage: UIImage(named: "5")!),
        Person(photoImage: UIImage(named: "person6")!, name: "Anny Clark", profession: .iOS, countryImage: UIImage(named: "6")!)],
        // Designers
        [Person(photoImage: UIImage(named: "person7")!, name: "Peter Krasinsky", profession: .designer, countryImage: UIImage(named: "7")!),
        Person(photoImage: UIImage(named: "person8")!, name: "Loren Ipsum", profession: .designer, countryImage: UIImage(named: "8")!)],
        // Android Developers
        [Person(photoImage: UIImage(named: "person9")!, name: "Mathew Smith", profession: .android, countryImage: UIImage(named: "9")!)],
        // Frontend Developers
        [Person(photoImage: UIImage(named: "person10")!, name: "Stacy Cruze", profession: .frontend, countryImage: UIImage(named: "10")!)]
    ]
}
