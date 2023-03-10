//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var largeResultLabel: UILabel!
    @IBOutlet var smallResultLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        guard let result = getResult(for: answers) else { return }
        
        largeResultLabel.text = "Вы - " + String(result.rawValue)
        smallResultLabel.text = result.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func getResult(for answers: [Answer]) -> Animal? {
        answers.map { $0.animal }
            .reduce(into: [:]) {
                counts, typeAnimal in
                counts[typeAnimal, default: 0] += 1
            }
            .sorted { $0.value > $1.value }
            .first?
            .key
    }
}

