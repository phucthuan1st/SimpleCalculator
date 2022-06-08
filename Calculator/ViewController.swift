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
        print(calcContent)
    }
    
    func clearLast() {
        calcContent.removeLast()
        calcArea.text = calcContent
    }
    
    @IBAction func tapZero(_ sender: Any) {
        addContent(value: "0")
    }
    
    @IBAction func tapDot(_ sender: Any) {
        addContent(value: ".")
    }
    
    @IBAction func tapEquals(_ sender: Any) {
        //show value
        let expression = NSExpression(format: calcContent)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        
        let resultString:String = String(format: "%f", result)
        
        calcResult.text = resultString
    }
    
    @IBAction func tapOne(_ sender: Any) {
        addContent(value: "1")
    }
    
    @IBAction func tapTwo(_ sender: Any) {
        addContent(value: "2")
    }
    
    @IBAction func tapThree(_ sender: Any) {
        addContent(value: "3")
    }
    
    @IBAction func tapPlus(_ sender: Any) {
        addContent(value: "+")
    }
    
    @IBAction func tapFour(_ sender: Any) {
        addContent(value: "4")
    }
    
    @IBAction func tapFive(_ sender: Any) {
        addContent(value: "5")
    }
    
    @IBAction func tapSix(_ sender: Any) {
        addContent(value: "6")
    }
    
    @IBAction func tapMinus(_ sender: Any) {
        addContent(value: "-")
    }
    
    @IBAction func tapSeven(_ sender: Any) {
        addContent(value: "7")
    }
    
    @IBAction func tapEight(_ sender: Any) {
        addContent(value: "8")
    }
    
    @IBAction func tapNine(_ sender: Any) {
        addContent(value: "9")
    }
    
    @IBAction func tapMutiply(_ sender: Any) {
        addContent(value: "*")
    }
    
    @IBAction func tapAC(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func tapC(_ sender: Any) {
        if (!calcContent.isEmpty) {
            clearLast()
        }
    }
    
    @IBAction func tapPercents(_ sender: Any) {
        addContent(value: "%")
    }
    
    @IBAction func tapDivide(_ sender: Any) {
        addContent(value: "/")
    }
    
    
}

