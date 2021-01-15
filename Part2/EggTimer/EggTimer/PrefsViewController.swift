//
//  PrefsViewController.swift
//  EggTimer
//
//  Created by CoderDream on 2021/1/15.
//

import Cocoa

class PrefsViewController: NSViewController {

    @IBOutlet weak var presetsPopup: NSPopUpButtonCell!
    
    @IBOutlet weak var customSlider: NSSliderCell!
    
    @IBOutlet weak var customTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func popupValueChanged(_ sender: Any) {
    }
    
    
    @IBAction func sliderValueChanged(_ sender: Any) {
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
    }
    
    
    @IBAction func okButtonClicked(_ sender: Any) {
    }
    
    
}
