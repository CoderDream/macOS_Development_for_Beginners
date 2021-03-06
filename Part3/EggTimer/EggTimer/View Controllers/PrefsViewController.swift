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
    
    var prefs = Preferences()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        showExistingPrefs()

    }
    
    
    @IBAction func popupValueChanged(_ sender: Any) {
        if (sender as AnyObject).selectedItem?.title == "Custom" {
              customSlider.isEnabled = true
              return
            }

        let newTimerDuration = (sender as AnyObject).selectedTag()
            customSlider.integerValue = newTimerDuration
            showSliderValueAsText()
            customSlider.isEnabled = false
    }
    
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        showSliderValueAsText()
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        view.window?.close()
    }
    
    
    @IBAction func okButtonClicked(_ sender: Any) {
        saveNewPrefs()
        view.window?.close()
    }
    
    func showExistingPrefs() {
      // 1
      let selectedTimeInMinutes = Int(prefs.selectedTime) / 60

      // 2
      presetsPopup.selectItem(withTitle: "Custom")
      customSlider.isEnabled = true

      // 3
      for item in presetsPopup.itemArray {
        if item.tag == selectedTimeInMinutes {
          presetsPopup.select(item)
          customSlider.isEnabled = false
          break
        }
      }

      // 4
      customSlider.integerValue = selectedTimeInMinutes
      showSliderValueAsText()
    }

    // 5
    func showSliderValueAsText() {
      let newTimerDuration = customSlider.integerValue
      let minutesDescription = (newTimerDuration == 1) ? "minute" : "minutes"
      customTextField.stringValue = "\(newTimerDuration) \(minutesDescription)"
    }

    func saveNewPrefs() {
      prefs.selectedTime = customSlider.doubleValue * 60
      NotificationCenter.default.post(name: Notification.Name(rawValue: "PrefsChanged"),
                                      object: nil)
    }

    
}
