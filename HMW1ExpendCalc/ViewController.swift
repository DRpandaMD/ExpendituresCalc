//
//  ViewController.swift
//  HMW1ExpendCalc
//
//  Created by Michael Zarate on 9/11/15.
//  Copyright (c) 2015 Michael Zarate. All rights reserved.
//

import UIKit

var foodTotalOutput : Double = 0
var transTotalOutput : Double = 0
var houseTotalOutput : Double = 0
var otherItemTotalOutput : Double = 0

var foodOutputPercent : Double = 0
var transOutputPercent : Double = 0
var houseOutputPercent : Double = 0
var otherOutputPercent : Double = 0

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var FoodLabel: UILabel!
    @IBOutlet weak var TransportationLabel: UILabel!
    @IBOutlet weak var HouseholdItemLabel: UILabel!
    @IBOutlet weak var OtherItemsLabel: UILabel!
    @IBOutlet weak var FoodTextField: UITextField!
    @IBOutlet weak var TransportationTextField: UITextField!
    @IBOutlet weak var HouseholdItemsTextField: UITextField!
    @IBOutlet weak var OtherItemsTextField: UITextField!
    @IBOutlet weak var OutputView: UIView!
    @IBOutlet weak var FoodViewLabel: UILabel!
    @IBOutlet weak var TransportationViewLabel: UILabel!
    @IBOutlet weak var HouseholdItemsViewLabel: UILabel!
    @IBOutlet weak var OtherItemsViewLabel: UILabel!
    @IBOutlet weak var TotalViewLabel: UILabel!
    @IBOutlet weak var PrecentageViewLabel: UILabel!
    @IBOutlet weak var FoodTotalTextField: UITextField!
    @IBOutlet weak var TransportationTotalTextField: UITextField!
    @IBOutlet weak var HouseholdItemsTotalTextField: UITextField!
    @IBOutlet weak var OtherItemsTotalTextField: UITextField!
    @IBOutlet weak var FoodPercentLabel: UILabel!
    @IBOutlet weak var TransportationPercentLabel: UILabel!
    @IBOutlet weak var HouseholdItemsPercentLabel: UILabel!
    @IBOutlet weak var OtherItemsPercentLabel: UILabel!
    
    
    
    // instantiate the object Model class here
    var expend: expendModel = expendModel()
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        FoodTextField.delegate = self
        TransportationTextField.delegate = self
        HouseholdItemsTextField.delegate = self
        OtherItemsTextField.delegate = self
        
        //end keyboard stuff
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    ///add buttons down here
    
    
    @IBAction func AddButton(sender: UIButton) {
        
        var foodAmt : Double = (FoodTextField.text as NSString ).doubleValue
        var transAmt : Double = (TransportationTextField.text as NSString).doubleValue
        var houseItemAmt : Double = (HouseholdItemsTextField.text as NSString).doubleValue
        var otherAmt : Double = (OtherItemsTextField.text as NSString).doubleValue
        
        foodTotalOutput = expend.addFood(foodAmt)
        transTotalOutput = expend.addTrans(transAmt)
        houseTotalOutput = expend.addHouseItem(houseItemAmt)
        otherItemTotalOutput = expend.addOtherTotal(otherAmt)
        
        foodOutputPercent = expend.foodPercent()
        transOutputPercent = expend.transPercent()
        houseOutputPercent = expend.housePercent()
        otherOutputPercent = expend.otherPercent()
        
        
        
        FoodTotalTextField.text = "\(foodTotalOutput)"
        TransportationTotalTextField.text = "\(transTotalOutput)"
        HouseholdItemsTotalTextField.text = "\(houseTotalOutput)"
        OtherItemsTotalTextField.text = "\(otherItemTotalOutput)"
        
        FoodPercentLabel.text = String(format: "%.2f", foodOutputPercent) + "%"
        TransportationPercentLabel.text = String(format: "%.2f", transOutputPercent) + "%"
        HouseholdItemsPercentLabel.text = String(format: "%.2f", houseOutputPercent) + "%"
        OtherItemsPercentLabel.text = String(format: "%.2f", otherOutputPercent) + "%"
        
        
        
        
        

        
    }
    
    
    @IBAction func ClearButton(sender: UIButton) {
        
        FoodTextField.text = "0"
        TransportationTextField.text = "0"
        HouseholdItemsTextField.text = "0"
        OtherItemsTextField.text = "0"
        
        
        
    }
    

    @IBAction func ClearAllButton(sender: UIButton) {
        
        FoodTextField.text = "0"
        TransportationTextField.text = "0"
        HouseholdItemsTextField.text = "0"
        OtherItemsTextField.text = "0"
        
        FoodTotalTextField.text = "0"
        TransportationTotalTextField.text = "0"
        HouseholdItemsTotalTextField.text = "0"
        OtherItemsTotalTextField.text = "0"
        
        FoodPercentLabel.text = "0%"
        TransportationPercentLabel.text = "0%"
        HouseholdItemsPercentLabel.text = "0%"
        
        OtherItemsPercentLabel.text = "0%"
        
        expend.valuesReset()
        mainValuesReset()
        
        
        
        
    }
    
    
    
    
    // move the view upwards as keyboard appears
    func keyboardWillShow(sender: NSNotification)
    {
        self.view.frame.origin.y -= 150
    }
    
    // move the keyboard back as keyboard disapears
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 150
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
        self.FoodTextField.resignFirstResponder()
        self.TransportationTextField.resignFirstResponder()
        self.HouseholdItemsTextField.resignFirstResponder()
        self.OtherItemsTextField.resignFirstResponder()
        
        
    }
    
    func mainValuesReset()
    {
        
         foodTotalOutput  = 0
         transTotalOutput  = 0
         houseTotalOutput  = 0
         otherItemTotalOutput  = 0
        
         foodOutputPercent  = 0
         transOutputPercent  = 0
         houseOutputPercent  = 0
         otherOutputPercent  = 0
    }




}







