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
        
        let result = answers.map { $0.animal }
            .reduce(into: [:]) {
                counts, typeAnimal in
                counts[typeAnimal, default: 0] += 1
            }
            .sorted(by: { $0.value > $1.value })
            .first?
            .key
        
        guard let result = result else { return }
        
        largeResultLabel.text = "Вы - " + String(result.rawValue)
        smallResultLabel.text = result.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

