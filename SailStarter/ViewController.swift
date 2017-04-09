//
//  ViewController.swift
//  SailStarter
//
//  Created by Bryan Gough on 2017-04-08.
//  Copyright © 2017 Bryan Gough. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var defaultTime:Double = 300
    var timeFrom:Double = 300
    var timer:Timer = Timer()
    var isTimerRunning = false
    var startTimeInterval: TimeInterval = 0.0
    var timeInterval: TimeInterval = 0.0
    
    
    
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var countDownLabel: UILabel!
    
    @IBOutlet var timePicker: TimePicker!
    
    // MARK: - Load
    override func viewDidLoad() {
        super.viewDidLoad()
        countDownLabel.text = timeString(time: TimeInterval(timeFrom))
        
    }
    
    // MARK: - Control Functions
    @IBAction func startTimer(_ sender: Any) {
        if(!isTimerRunning)
        {
            runTimer();
            startButton.isEnabled = false;
        }
    }
    @IBAction func forceTime(_ sender: Any) {
        timeFrom = timePicker.getTime()
        startTimeInterval = Date.timeIntervalSinceReferenceDate
        countDownLabel.text = timeString(time: TimeInterval(timeFrom))
    }
    @IBAction func resetTimer(_ sender: Any) {
        endTimer()
        timeFrom = defaultTime
        countDownLabel.text = timeString(time: TimeInterval(timeFrom))
    }
    
    // MARK: - Timer
    func runTimer() {
        isTimerRunning = true;
        startTimeInterval = Date.timeIntervalSinceReferenceDate
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    func endTimer(){
        timer.invalidate();
        isTimerRunning = false;
        startButton.isEnabled = true;
    }
    
    func updateTimer() {
        timeInterval = Date.timeIntervalSinceReferenceDate - startTimeInterval
        let difference = timeFrom - timeInterval;
        countDownLabel.text = timeString(time: TimeInterval(difference))
        if(difference<=0)
        {
            endTimer()
        }
    }
    
    // MARK: - UI Manipulation
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        let miliseconds:Double = time.truncatingRemainder(dividingBy: 1)
        let m = miliseconds * 1000;
        let milisecondsInt = Int(m)
        return String(format:"%2i:%02i.%003i", minutes, seconds, milisecondsInt)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

