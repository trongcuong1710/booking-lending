//
//  AuthenticationViewController.swift
//  booklending
//

import UIKit
import UIAlertController_Blocks

class AuthenticationViewController: UIViewController {
    fileprivate(set) var presenter: AuthenticationPresenterProtocol
    
    @IBOutlet private weak var signInGoogleButton: UIButton!
    
    init(presenter: AuthenticationPresenterProtocol = AuthenticationPresenter()) {
        self.presenter = presenter
        
        super.init(nibName: "AuthenticationViewController", bundle: Bundle.main)
        
        self.presenter.view = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.signInGoogleButton.layer.cornerRadius = 25
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction private func signInGoogleButtonDidTouch(sender: UIButton!) {
        self.presenter.signInButtonDidTouch()
    }
}

extension AuthenticationViewController: AuthenticationViewProtocol {
    func show(error: Error) {
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: "Sign In Failed!", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func authenticationSucceed(user: User) {
        let booksListController = BooksListViewController()
        self.navigationController?.pushViewController(booksListController, animated: true)
    }
}
