//
//  Coordinator.swift
//  SystemColors
//
//  Created by Pedro Vasconcelos on 19/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import UIKit

protocol Coordinator {

    var navigationController: UINavigationController { get }
    func start()
    
}
