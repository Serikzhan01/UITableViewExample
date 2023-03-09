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
        [Person(photoImage: UIImage(named: "person8")!, name: "Nataly Philips", profession: .seo, countryImage: UIImage(named: "ac")!)],
        // Product Managers
        [Person(photoImage: UIImage(named: "person9")!, name: "Serj Estimoza", profession: .product, countryImage: UIImage(named: "ag")!)],
        // Project Managers
        [Person(photoImage: UIImage(named: "person1")!, name: "Jack Whilde", profession: .project, countryImage: UIImage(named: "ad")!)],
        // Backend Developer
        [Person(photoImage: UIImage(named: "person7")!, name: "Lisa Coulman", profession: .backend, countryImage: UIImage(named: "ae")!)],
        // iOS Developers
        [Person(photoImage: UIImage(named: "person10")!, name: "Jane Foster", profession: .iOS, countryImage: UIImage(named: "ae")!),
        Person(photoImage: UIImage(named: "person2")!, name: "Anny Clark", profession: .iOS, countryImage: UIImage(named: "af")!)],
        // Designers
        [Person(photoImage: UIImage(named: "person6")!, name: "Peter Krasinsky", profession: .designer, countryImage: UIImage(named: "af")!),
        Person(photoImage: UIImage(named: "person4")!, name: "Loren Ipsum", profession: .designer, countryImage: UIImage(named: "ai")!)],
        // Android Developers
        [Person(photoImage: UIImage(named: "person5")!, name: "Mathew Smith", profession: .android, countryImage: UIImage(named: "al")!)],
        // Frontend Developers
        [Person(photoImage: UIImage(named: "person3")!, name: "Stacy Cruze", profession: .frontend, countryImage: UIImage(named: "ag")!)]
    ]
}
