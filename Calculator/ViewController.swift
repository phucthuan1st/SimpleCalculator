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
    @IBOutlet weak var resultArea: UILabel!
    
    var calcContent:String = ""
    
    override func viewDidLoad() {
        clearAll()
        super.viewDidLoad()
    }
    
    func clearAll() {
        calcArea.text = ""
        resultArea.text = ""
        calcContent = ""
        print("All clear")
    }
    
    func addContent(value: String) {
        calcContent = calcContent + value
        print("Button hit -> Change content to \(calcContent)")
        calcArea.text = calcContent
    }
    
    func clearLast() {
        calcContent.removeLast()
        print("Clear last character")
        calcArea.text = calcContent
    }
    
    @IBAction func tapZero(_sender: Any) {
        addContent(value: "0")
    }
    
    @IBAction func tapDot(_sender: Any) {
        addContent(value: ".")
    }
    
    @IBAction func tapEquals(_sender: Any) {
        let (check, result) = Expression.getExpressionValue(expression: calcContent)
        
        if (check == true) {
            
            var format:String = "%f"
            if result.rounded() == result {
                format = "%.0f"
            }
            
            let resultString:String = String(format: format, result)
            
            resultArea.text = resultString
            calcArea.text = ""
            calcContent = ""
        }
        else {
            let alert = UIAlertController(title: "Invalid Input",
                                          message: "Your expression is not true",
                                          preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Go back", style: .default))
            self.present(alert, animated: true)
        }
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

class Char {
    public static func specialCharacter(char: Character) -> Bool {
        if char == "+" {
            return true
        }
        if char == "*" {
            return true
        }
        if char == "/" {
            return true
        }
        if char == "-" {
            return true
        }
        
        return false
    }
    
    public static func isANumber(char: Character) -> Bool {
        return char.isNumber
    }
}

class Expression {
    
    // check if an expression is valid
    static func validExpression(expression: String) -> Bool {
        
        var charArr = [Character]()
        for char in expression {
            charArr.append(char)
        }
        var i = 1
        while i < (charArr.count - 2) {
            if (Char.specialCharacter(char: charArr[i])) {
                if Char.specialCharacter(char: charArr[i-1]) || (i < charArr.count && Char.specialCharacter(char: charArr[i+1])) {
                    return false
                }
            }

            if (charArr[i] == "%") {
                if !Char.isANumber(char: charArr[i-1]) ||
                    (i < charArr.count - 1 && !Char.specialCharacter(char: charArr[i+1])) {
                    return false
                }
            }
            
            i = i + 1
        }
        
        if Char.specialCharacter(char: charArr[charArr.count - 1]) || Char.specialCharacter(char: charArr[0]) {
            return false
        }
        
        return true
    }
    
    // rewrite expression for exactly calculating
    static func reWriteExpression(expression: String) -> String {
        var charArr = [Character]()
        
        for char in expression {
            charArr.append(char)
        }
        
        var i = 1
        while i < (charArr.count) {
            print(charArr[i])
            if (charArr[i] == "%") {
                
                var j = i - 1
                
                while j > 0 && !Char.specialCharacter(char: charArr[j]) {
                    j = j - 1
                }
                
                if Char.specialCharacter(char: charArr[j]) {
                    charArr.insert(")", at: i + 1)
                    charArr.insert("(", at: j + 1)
                }
                
                i = i + 2
            }
            else {
                i = i + 1
            }
        }
        
        
        var ex:String = ""
        for char in charArr {
            ex = ex + String(char)
        }
        
        ex = "1.0*(" + ex.replacingOccurrences(of: "%", with: "*0.01") + ")"
        print("Expression after rewrite: \(ex)")
        
        return ex
    }
    
    // calculate the expression
    public static func getExpressionValue(expression: String) -> (Bool, Double) {
        let check:Bool = validExpression(expression: expression)
        var result:Double = 0
        
        if (check) {
            let ex = reWriteExpression(expression: expression)
            let resultExpression = NSExpression(format: ex)
            result = resultExpression.expressionValue(with: nil, context: nil) as! Double
        }
        
        return (check, result)
    }
}
