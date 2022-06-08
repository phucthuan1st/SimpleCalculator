//
//  ViewController.swift
//  Calculator
//
//  Created by MacMini01 on 08/06/2022.
//
import UIKit

class ViewController : UIViewController
{
    
    @IBOutlet weak var calcArea: UILabel!
    @IBOutlet weak var calcResult: UILabel!
    
    var calcContent:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll() {
        calcArea.text = ""
        calcResult.text = ""
        calcContent = ""
    }
    
    func addContent(value: String) {
        calcContent = calcContent + value
        calcArea.text = calcContent
    }
    
    func clearLast() {
        calcContent.removeLast()
        calcArea.text = calcContent
    }
    
    @IBAction func tapZero(_sender: Any) {
        addContent(value: "0")
    }
    
    @IBAction func tapDot(_sender: Any) {
        addContent(value: ".")
    }
    
    @IBAction func tapEquals(_sender: Any) {
        //show value
        let resultExpression = calcContent.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: resultExpression)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        
        let resultString:String = String(format: "%f", result)
        
        calcResult.text = resultString
        
    }
    
    @IBAction func tapOne(_sender: Any) {
        addContent(value: "1")
    }
    
    @IBAction func tapTwo(_sender: Any) {
        addContent(value: "2")
    }
    
    @IBAction func tapThree(_sender: Any) {
        addContent(value: "3")
    }
    
    @IBAction func tapPlus(_sender: Any) {
        addContent(value: "+")
    }
    
    @IBAction func tapFour(_sender: Any) {
        addContent(value: "4")
    }
    
    @IBAction func tapFive(_sender: Any) {
        addContent(value: "5")
    }
    
    @IBAction func tapSix(_sender: Any) {
        addContent(value: "6")
    }
    
    @IBAction func tapMinus(_sender: Any) {
        addContent(value: "-")
    }
    
    @IBAction func tapSeven(_sender: Any) {
        addContent(value: "7")
    }
    
    @IBAction func tapEight(_sender: Any) {
        addContent(value: "8")
    }
    
    @IBAction func tapNine(_sender: Any) {
        addContent(value: "9")
    }
    
    @IBAction func tapMutiply(_sender: Any) {
        addContent(value: "*")
    }
    
    @IBAction func tapAC(_sender: Any) {
        clearAll()
    }
    
    @IBAction func tapC(_sender: Any) {
        if (!calcContent.isEmpty) {
            clearLast()
        }
    }
    
    @IBAction func tapPercents(_sender: Any) {
        addContent(value: "%")
    }
    
    @IBAction func tapDivide(_sender: Any) {
        addContent(value: "/")
    }
    
    
}

