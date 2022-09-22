//
//  ViewController.swift
//  Tictactoe
//
//  Created by Cecilia Andrea Pesce on 20/09/22.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var enterTheMatrizSizeLabel: UILabel!
    @IBOutlet weak var gridNumberSizeTextField: UITextField!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gridNumberSizeTextField.keyboardType = .numberPad

    }

    @IBAction func didTapOkButton(_ sender: Any) {
        guard let matrixSize = gridNumberSizeTextField.text else { return }
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let ticTacToeViewController = storyboard.instantiateViewController(withIdentifier: "TicTacToeViewController") as? TicTacToeViewController {
                ticTacToeViewController.configure(with: Int(matrixSize))
                self.navigationController?.pushViewController(ticTacToeViewController, animated: true)
            }
        }
    }
    
    
}

