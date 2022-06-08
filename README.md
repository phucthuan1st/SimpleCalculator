# Simple Calculator

## A simple Calculator build with Swift
- Platform: iOS
- Language: Swift
- IDE: XCode

## About the model: 
Using the SwiftUI, I create the theme of this app
![Model View](https://github.com/phucthuan1st/SimpleCalculator/blob/main/Docs/Screen%20Shot%202022-06-08%20at%2015.53.44.png)
- The calculate area stand on a view-field, with contain 02 labels (expression and result labels)
- The button area stand on a vertical-view-field, each-4 or 3 button stand together on a horizontial-view-field

## Button and Label
- For each button, connect to a function (with @IBAction wrapped)
- For each label, connect to a variable (with @IOutlet wrapper)

## Exception Handle
In this project, there is an exception when user input an invalid expression, it will cautch an error, so for that, I throw an alert
![Alert1](https://github.com/phucthuan1st/SimpleCalculator/blob/main/Docs/Screen%20Shot%202022-06-08%20at%2016.03.32.png)

Alert occur when meet invalid expression

![Alert2](https://github.com/phucthuan1st/SimpleCalculator/blob/main/Docs/Screen%20Shot%202022-06-08%20at%2016.05.52.png)
