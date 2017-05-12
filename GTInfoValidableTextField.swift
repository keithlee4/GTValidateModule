//
//  GTInfoValidableTextField.swift
//  UniversalModule
//
//  Created by keith.lee on 2016/10/11.
//  Copyright © 2016年 git4u. All rights reserved.
//

import UIKit


class GTInfoValidableTextField: KLTextField, GTValidableViewInterface {

    var errorLabel: UILabel?
    
    var valueStorage: GTValidableValueStorage!
    
    //Var to use when input view is not keyboard type.
    var datePicker: UIDatePicker?
    
    var dataPicker: UIPickerView?
    
    var pickerOnFirstRow = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.setCustomDoneTarget(self, action: #selector(self.doneAction(_:)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //        self.setCustomDoneTarget(self, action: #selector(self.doneAction(_:)))
        self.addTarget(self, action:#selector(textChanged(sedner:)) , for: .editingChanged)
    }
    
    var contentText: String? {
        print("inside: \(String(describing: self.valueStorage.value))")
        return self.valueStorage.value
    }
    
    
    func dismissKeyboardIfNeeded(shouldCheck check:Bool){
        if self.isFirstResponder {
            if !check {
                self.delegate = nil
            }
            
            self.resignFirstResponder()
            self.setupDelegate()
        }
    }
    
    func clearView() {
        self.text = nil
        self.valueStorage.value = nil
        
        switch self.valueStorage.validateInfo.keyboardType! {
        case .basic, .decimal, .number:
            break
        case .picker(_):
            guard let picker = dataPicker else{
                print("Warning - trying to clear picker, but no data picker was found.")
                return
            }
            
            self.valueStorage.validateInfo.keyboardType = .picker([])
            if picker.selectedRow(inComponent: 0) != -1 {
                dataPicker = UIPickerView.init()
                dataPicker?.delegate = self
                dataPicker?.dataSource = self
                self.inputView = dataPicker
            }else{
                print("Picker has not select any row, no need to clear")
                return
            }
        case .datePicker(_):
            guard let datePicker = self.datePicker else{
                print("Warning - trying to clear date picker , but no date picker was found.")
                return
            }
            
            datePicker.date = Date()
        }
    }
    
    func reload() {
        self.configure(with: self.valueStorage, delegateTarget: self.valueStorage.validateInfo.validateDelegate, updateListener: self.valueStorage.valueUpdateListener)
    }
    
    func configure(with valueStorage:GTValidableValueStorage, delegateTarget: GTInfoValidateInfoDelegate? = nil, updateListener: GTValidableValueStorageUpdateListener? = nil){
        self.text = valueStorage.value
        
        valueStorage.containedView = self
        valueStorage.valueUpdateListener = updateListener
        
        self.valueStorage = valueStorage
        self.valueStorage.validateInfo.validateDelegate = delegateTarget
        self.setupDelegate()
        self.setupValidateInfo(with: valueStorage.validateInfo)
    }
    
    func setupValidateInfo(with validateInfo:GTValidateInfo){
        
        self.setupKeyboard(with: validateInfo.keyboardType!)
        
        self.attributedPlaceholder = NSAttributedString(string: validateInfo.placeholderText, attributes: [NSForegroundColorAttributeName:UIColor.lightGray])
        self.isSecureTextEntry = validateInfo.secured
    }
    
    func setupKeyboard(with type:GTKeyboardType){
        switch type {
        case .number:
            self.inputView = nil
            self.keyboardType = .numberPad
        case .decimal:
            self.inputView = nil
            self.keyboardType = .decimalPad
        case .basic:
            self.inputView = nil
            self.keyboardType = .default
            
        case .datePicker(let dateInfo):
            let picker = UIDatePicker.init()
            picker.datePickerMode = dateInfo.datePickerMode
            picker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
            
            self.datePicker = picker
            
            self.inputView = picker
            
        case .picker(_):
            let picker = UIPickerView.init()
            picker.dataSource = self
            picker.delegate = self
            
            self.inputView = picker
            self.dataPicker = picker
        }

    }
    
    func setupDelegate() {
        self.delegate = self
    }
    
    func updateInfo(with validateInfo:GTValidateInfo){
        self.valueStorage.validateInfo = validateInfo
        self.setupValidateInfo(with: validateInfo)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //MARK: - Input View Action
    func dateChanged(_ datePicker:UIDatePicker) {
        guard case let GTKeyboardType.datePicker(dateInfo) = self.valueStorage.validateInfo.keyboardType! else{
            return
        }
        
        let df = DateFormatter()
        df.dateFormat = dateInfo.dateFormat
        
        let dateString = df.string(from: datePicker.date)
        
        self.text = dateString
        self.valueStorage.value = self.text
    }
    
    func doneAction(_ sender : UITextField) {
        
        //on picker type  & user haven`t scroll yet , Auto give first row value to text
        acceptFirstPickerRowValueifNotScrolling()
        
        //outside the picker type , process vaildate
        self.valueStorage.checkValidity { }
        pickerOnFirstRow = true
    }
    
    func acceptFirstPickerRowValueifNotScrolling(){
        if case let GTKeyboardType.picker(pickerValues) = self.valueStorage.validateInfo.keyboardType!{
            
            //if picker has empty , won`t process
            //pickerOnFirstRow == true, mean done action is fired.
            if pickerOnFirstRow == true && pickerValues.count > 0 {
                self.text = pickerValues[0].pickerSelectContentTitle
                self.valueStorage.value = self.text
                self.valueStorage.checkValidity {}
                pickerOnFirstRow = true
                return
            }
        }
    }
    
    func textChanged(sedner: UITextField){
        self.valueStorage.value = sedner.text ?? nil
    }
    
    
    //MARK: Result Handle
    func handleSuccess() {
//        backgroundColor = successBGColor
//        if let errLabel = errorLabel {
//            errLabel.isHidden = true
//        }
    }
    
    
    func handleError(err: Error?) {
//        backgroundColor = errorBGColor
//        shake()
//        errorLabel?.isHidden = false
//        
//        if let errLabel = errorLabel {
//            errLabel.text = err?.descString
//        }else {
//            let frame = self.frame
////            clipsToBounds = false
//            
//            let x = frame.origin.x
//            let y = frame.origin.y + frame.height + 2
//            let width = frame.width
//            let height : CGFloat = 0
//            let errLabel = UILabel.init(frame: CGRect.init(x: x, y: y, width: width, height: height))
//            
//            errLabel.numberOfLines = 0
//            errLabel.lineBreakMode = .byWordWrapping
//            
//            errLabel.textColor = UIColor.wddPaleRed
//            errLabel.font = UIFont.systemFont(ofSize: 10)
//            
//            errLabel.text = err?.descString
//            
//            superview?.addSubview(errLabel)
//            errorLabel = errLabel
//        }
//        
//        errorLabel?.sizeToFit()
    }
}

extension GTInfoValidableTextField: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard case let GTKeyboardType.picker(pickerValues) = self.valueStorage.validateInfo.keyboardType! else {
            return 0
        }
        
        return pickerValues.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        guard case let GTKeyboardType.picker(pickerValues) = self.valueStorage.validateInfo.keyboardType! else {
//            return nil
//        }
//        
//        return pickerValues[row].pickerTitle
//    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        guard case let GTKeyboardType.picker(pickerValues) = self.valueStorage.validateInfo.keyboardType! else {
            return nil
        }
        
        return pickerValues[row].pickerAttrTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        guard case let GTKeyboardType.picker(pickerValues) = self.valueStorage.validateInfo.keyboardType!
        else {
            return
        }
        self.attributedText = pickerValues[row].pickerSelectContentAttrTitle
        self.valueStorage.value = self.attributedText?.string
        
        //user scroll the picker , tag that 
        pickerOnFirstRow = false
    }
}

extension GTInfoValidableTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //Depending on the valid status, call handle block,
        //This class will not know what should be done.
        
        //if pickerType keyboard dismiss without select, we should assume user select first data.
        if self.valueStorage.value == nil {
            if case .picker(let value) = self.valueStorage.validateInfo.keyboardType! {
                if let defaultSelection = value.first {
                    self.dataPicker?.selectRow(0, inComponent: 0, animated: false)
                    
                    self.valueStorage.updateValueString(with: defaultSelection.pickerTitle, checkCompletion: nil)
                    self.reload()
                }else{
                    //if there's no input data
                }
                
            }else if case .datePicker(let info) = self.valueStorage.validateInfo.keyboardType! {
                if let defaultDate = self.datePicker?.date {
                    let formatter = DateFormatter.init()
                    formatter.dateFormat = info.dateFormat
                    let dateString = formatter.string(from: defaultDate)
                    
                    self.valueStorage.updateValueString(with: dateString, checkCompletion: nil)
                    self.reload()
                }
            }
        }
        
        self.valueStorage.checkValidity { }
        
    }
    
    
    //Picker-type keyboard only allow editing when input count > 0 
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if case .picker(let value) = self.valueStorage.validateInfo.keyboardType! {
            return value.count > 0
        }else {
            return true
        }
    }
}
