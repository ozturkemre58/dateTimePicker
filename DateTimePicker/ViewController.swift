//
//  ViewController.swift
//  DateTimePicker
//
//  Created by Emre Öztürk on 27.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timeTF: UITextField!
    @IBOutlet weak var dateTF: UITextField!
    
    
    var datePicker: UIDatePicker?
    var timePicker: UIDatePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViews()
        tapGestures()
    }
    
    func prepareViews() {
        //datepicker & dateTF
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        dateTF.inputView = datePicker
        
        //timepicker & hourTF
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        timeTF.inputView = timePicker
        
        if #available(iOS 13.4, *) {
            datePicker?.preferredDatePickerStyle = .wheels
            timePicker?.preferredDatePickerStyle = .wheels
        }
    }
    
    func tapGestures() {
        let closePickerAction = UITapGestureRecognizer(target: self, action: #selector(closePickerAction))
        view.addGestureRecognizer(closePickerAction)
        
        datePicker?.addTarget(self, action: #selector(showDate(datePicker:)), for: .valueChanged)
        timePicker?.addTarget(self, action: #selector(showTime(timePicker:)), for: .valueChanged)
    }
    
    
    @objc func closePickerAction() {
        view.endEditing(true)
    }
    
    @objc func showDate(datePicker: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "MM/dd/yyyy"
        let dateInput = format.string(from: datePicker.date)
        dateTF.text = dateInput
    }
    
    @objc func showTime(timePicker: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let timeInput = format.string(from: timePicker.date)
        timeTF.text = timeInput
    }
    
}

