//
//  ViewController.swift
//  colorsSlidersTextFieldsLinked
//
//  Created by admin on 1/8/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mySlider = UISlider()
    var myTextBox = UITextField()
    var nightModeButton = UIButton()
//    var alert = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        
        //You don't add additional attributes, it's a whole new object.  So ALL attributes must be added with this function call
        mySlider = addColor(color: .red, slider: mySlider)
        myTextBox = addColor(color: .red, text: myTextBox)
        nightModeButton = setupButton(button: nightModeButton)
//        alert = setupAlert()
        
        mySlider.addTarget(self, action: #selector(sliderMoved(sender:)), for: UIControlEvents.valueChanged)
        myTextBox.addTarget(self, action: #selector(textBoxChanged(sender:)), for: UIControlEvents.editingDidEnd)
        nightModeButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchDown )
        
        self.hideKeyboard()  //from extension
        
        view.addSubview(myTextBox)
        view.addSubview(mySlider)
        view.addSubview(nightModeButton)
        
        mySlider.translatesAutoresizingMaskIntoConstraints = false
        myTextBox.translatesAutoresizingMaskIntoConstraints = false
        nightModeButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        nightModeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nightModeButton.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor, constant: 30).isActive = true
        
        mySlider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mySlider.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mySlider.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        myTextBox.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myTextBox.topAnchor.constraint(equalTo: mySlider.bottomAnchor, constant: 50).isActive = true
    }
    
    func setupButton(button: UIButton) -> UIButton{
        let tempButton = button
        tempButton.setTitle("Show Alert", for: .normal)
        tempButton.setTitleColor(.black, for: .normal)
        tempButton.backgroundColor = .white
        return tempButton
    }
    
    
    @objc func buttonPressed(sender: UIButton){
        print("Button pressed")
        
        let tempAlert = UIAlertController(title: "Invalid Value",
                                          message: "Please enter a numerical value \nFrom 0 to 255",
                                          preferredStyle: .alert)
        
        tempAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        
        tempAlert.addTextField(configurationHandler: {textField in
            textField.placeholder = "Please enter new value here ..."
            textField.keyboardType = .numberPad
            
            self.present(tempAlert, animated: true, completion: nil)
        })
    }    
    
    func addColor(color: UIColor, slider: UISlider) -> UISlider {
        let tempSlider = UISlider()
        tempSlider.minimumValue = 0
        tempSlider.maximumValue = 255
        tempSlider.minimumTrackTintColor = color
        tempSlider.maximumTrackTintColor = color
        tempSlider.thumbTintColor = color
        tempSlider.isContinuous = true
        return tempSlider
    }
    
    func addColor(color: UIColor, text: UITextField) -> UITextField {
        let tempText = UITextField()
        tempText.textColor = color
        tempText.backgroundColor = .white
        tempText.keyboardType = UIKeyboardType.numberPad
        tempText.returnKeyType = UIReturnKeyType.done
        tempText.placeholder = "Waiting for Value"
        tempText.delegate = self
        return tempText
    }
    
    
    
    @objc func sliderMoved(sender: UISlider){
        myTextBox.text = String(sender.value)
    }
    
    @objc func textBoxChanged(sender: UITextField){
        mySlider.value = Float(sender.text!) ?? 0.0  //<--- this line works
        //        guard let mySlider.value = Float(sender.text!)!
    }
}

