//
//  ViewController.swift
//  Messager
//
//  Created by Wang, Chongbei on 2/24/21.
//  Copyright © 2021 com.wchb. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - IBOutlets
    //labels
    @IBOutlet weak var emailLabelOutlet:UILabel!
    @IBOutlet weak var passwordLabelOutlet: UILabel!
    @IBOutlet weak var repeatpasswordLabelOutlet: UILabel!
    @IBOutlet weak var signUpLabel: UILabel!
    
    
    //TextFields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    //Buttons
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var signUpButtionOutlet: UIButton!
    @IBOutlet weak var resendEmailButtonOutlet: UIButton!
    
    //Views
    
    @IBOutlet weak var repeatPasswordLineVew: UIView!
    
   //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - IBActions
    
    @IBAction func loginButtionPressed(_ sender: Any) {
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
    }
    
    @IBAction func resendEmailButtonPressed(_ sender: Any) {
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
    }
    
}

