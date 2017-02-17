//
//  BooksListViewController.swift
//  booklending
//

import UIKit

class BooksListViewController: UIViewController {
    init() {
        super.init(nibName: "BooksListViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
