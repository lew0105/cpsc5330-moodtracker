//
//  ViewController.swift
//  MoodTracker
//
//  Created by user289249 on 1/29/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var savedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50

        savedLabel.text = ""
        updateMoodLabel(for: Int(slider.value))
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        updateMoodLabel(for: Int(sender.value))
    }

    @IBAction func saveMoodTapped(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"

        let dateString = formatter.string(from: datePicker.date)
        let emoji = moodEmoji(for: Int(slider.value))

        savedLabel.text = "On \(dateString), you felt \(emoji)"
    }

    private func updateMoodLabel(for value: Int) {
        let text = moodText(for: value)
        let emoji = moodEmoji(for: value)
        moodLabel.text = "Feeling: \(text) \(emoji)"
    }

    private func moodText(for value: Int) -> String {
        switch value {
        case 0...20: return "Very Sad"
        case 21...40: return "Sad"
        case 41...60: return "Neutral"
        case 61...80: return "Happy"
        default: return "Very Happy"
        }
    }

    private func moodEmoji(for value: Int) -> String {
        switch value {
        case 0...20: return "😢"
        case 21...40: return "🙁"
        case 41...60: return "😐"
        case 61...80: return "🙂"
        default: return "😄"
        }
    }
}
