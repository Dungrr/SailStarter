//
//  TimeViewController.swift
//  SailStarter
//
//  Created by Bryan Gough on 2017-04-08.
//  Copyright © 2017 Bryan Gough. All rights reserved.
//
// https://developer.apple.com/reference/uikit/uipickerview
// http://stackoverflow.com/questions/29617835/how-do-i-setup-a-second-component-with-a-uipickerview
// http://stackoverflow.com/questions/35708300/showing-uipickerview-with-selected-row
//
import UIKit

class TimePicker: UIPickerView, UIPickerViewDelegate {
    
    let minutes = Array(0...5)
    let seconds = [0,15,30,45]
    var selectedMinutes = 0
    var selectedSeconds = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        doinit()
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        doinit()
    }
    func doinit()
    {
        self.delegate = self
        self.selectRow(5, inComponent: 0, animated: true)
    }
    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int {
        return 2
    }
   
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //row = [repeatPickerView selectedRowInComponent:0];
        
        let row = pickerView.selectedRow(inComponent: 0)
        print("this is the pickerView\(row)")
        
        if component == 0 {
            return minutes.count
        }
            
        else {
            return seconds.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return String(minutes[row])
        } else {
            
            return String(seconds[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print("picked \(row) + \(component)")
        if component == 0 {
            selectedMinutes = row
        } else {
            
            selectedSeconds = row
        }
    }
    func getTime()-> Double
    {
        let selected:Double = Double(minutes[selectedMinutes]*60 + seconds[selectedSeconds])
        print("\(selected) \(minutes[selectedMinutes]) \(seconds[selectedSeconds])")
        return selected
    }
}
