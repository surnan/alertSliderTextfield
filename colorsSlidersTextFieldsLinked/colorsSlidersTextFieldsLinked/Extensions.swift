//
//  TextFieldDelegateFile.swift
//  colorsSlidersTextFieldsLinked
//
//  Created by admin on 1/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension ViewController: UITextFieldDelegate {
    
    // MARK:- ---> Textfield Delegates
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("TextField did begin editing method called")
    }
    
    private func textFieldDidEndEditing(textField: UITextField) {
//        print("TextField did end editing method called")
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        print("TextField should begin editing method called")
        return true;
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        print("TextField should clear method called")
        return true;
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        print("TextField should snd editing method called")
        return true;
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print("While entering the characters this method gets called")
        return true;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }
    // MARK: Textfield Delegate
}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
