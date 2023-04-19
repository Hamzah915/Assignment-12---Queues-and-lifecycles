//
//  ViewController.swift
//  Fruit MVVM
//
//  Created by Hamzah Azam on 13/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var loginViewModel = LoginViewModel()
    
    
    @IBOutlet weak var secondStoryBoard: UIButton!
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var FruitLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordID: UITextField!
    @IBOutlet weak var emailID: UITextField!
    @IBAction func fruitDetailsButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tableVC = storyboard.instantiateViewController(withIdentifier: "TableViewController")
        self.navigationController?.pushViewController(tableVC, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func signInButtonClicked(_ sender: Any) {
        let emailID = emailID.text
        let passwordID = passwordID.text
        
        if loginViewModel.doValidLogin(emailID: emailID, passwordID: passwordID){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tableVC = storyboard.instantiateViewController(withIdentifier: "TableViewController")
            self.navigationController?.pushViewController(tableVC, animated: true)
        }else{
            print("Invalid login")
            let alertViewController = UIAlertController(title: "oops", message: "Invalid credentials", preferredStyle: .actionSheet)
            alertViewController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (alert:UIAlertAction!) in
                print("Cancel")
            }))
            alertViewController.addAction(UIAlertAction(title: "Login", style: .default))
            self.present(alertViewController, animated: true, completion: nil)
            
        }
        
        
    }
    
}
