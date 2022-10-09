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
        guard let matrixSizeInt = Int(matrixSize) else { return }
        guard isValidMatrixSize(size: matrixSizeInt) else {
            //TODO : Mostrar um erro na tela, seja uma label, ou outro (ou  chamar função de alertview dentro do dispatch)
            showAlertError()
            return }
        showTicTacToeViewController(with: matrixSizeInt)
    }
    
    // MARK: Validations
    func isValidMatrixSize(size: Int) -> Bool {
       return size >= 3 && size <= 7
    }
}

extension MainViewController {
    // MARK: ViewController Routes
    func showAlertError() {
        //todo: configurar o alerterror com mensagem de erro
        let alert = UIAlertController(title: "Ops!",
                                      message: "Type number between 3 and 7",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil ))
        
        present(alert,
                     animated: true,
                     completion: nil)
    }
    
    func showTicTacToeViewController(with size: Int) {
        //todo: migrar rota de sucesso da viewcontroller da 28 em diante.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let ticTacToeViewController = storyboard.instantiateViewController(withIdentifier: "TicTacToeViewController") as? TicTacToeViewController {
            ticTacToeViewController.configure(with: size)
            navigationController?.pushViewController(ticTacToeViewController, animated: true)
        }
    }
}
