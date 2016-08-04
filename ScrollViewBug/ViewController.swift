//
//  ViewController.swift
//  ScrollViewBug
//
//  Created by Colm Du Ve on 04/08/2016.
//  Copyright © 2016 dooverSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var device: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let appDelegate = UIApplication.sharedApplication().delegate! as! AppDelegate
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        registerForKeyboardNotifications()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Center scrollview for 5/5s screen size
        let offsetY = ((scrollView.contentSize.height - scrollView.bounds.height) / 2) + 10
        scrollView.contentOffset = CGPointMake(0, offsetY)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    @IBAction func signUpPressed(sender: AnyObject) {
        
        print("Signup button was pressed")
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        view.endEditing(true)
    }
    
    func registerForKeyboardNotifications() {
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIKeyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIKeyboardWillChangeFrameNotification, object: nil)
    }
    
    func adjustForKeyboard(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let keyboardViewEndFrame = view.convertRect(keyboardScreenEndFrame, fromView: view.window)
        
        if notification.name == UIKeyboardWillHideNotification {
            scrollView.contentInset = UIEdgeInsetsZero
            
            // Hack to make it work which cause little jump in scroll view
            scrollView.contentOffset = CGPoint(x: 0, y: 0)
            
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        scrollView.scrollRectToVisible(textField.frame, animated: true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        switch textField {
        case firstName:
            lastName.becomeFirstResponder()
        case lastName:
            email.becomeFirstResponder()
        case email:
            password.becomeFirstResponder()
        case password:
            confirmPassword.becomeFirstResponder()
        case confirmPassword:
            device.becomeFirstResponder()
        case device:
            device.resignFirstResponder()
        default: break
        }
        return true
    }

}

