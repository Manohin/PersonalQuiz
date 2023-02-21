//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    var answers: [Answer]!
    
    @IBOutlet var largeResultLabel: UILabel!
    @IBOutlet var smallResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        largeResultLabel.text = "Вы - " + String(getResult(for: answers)?.rawValue ?? " ")
        smallResultLabel.text = getResult(for: answers)?.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

private func getResult(for answers: [Answer]) -> Animal? {
    
    var animalsCount: [Animal: Int] = [:]
    
    let animals = answers.map { $0.animal }
    
    for animal in animals {
        if let typeOfAnimal = animalsCount[animal] {
            animalsCount.updateValue(typeOfAnimal + 1, forKey: animal)
        } else {
            animalsCount[animal] = 1
        }
    }
    return animalsCount.sorted(by: { $0.value > $1.value }).first?.key
}
