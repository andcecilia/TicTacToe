//
//  TicTacToeCollectionViewCell.swift
//  Tictactoe
//
//  Created by Cecilia Andrea Pesce on 21/09/22.
//
//
import Foundation
import UIKit

public struct XOrOList: Codable, Equatable {
    var itens: [XOrO]?
}

public struct XOrO: Codable, Equatable {
    var checked: Bool?
}

protocol TicTacToeCollectionViewCellDelegate: AnyObject {
    func ticTacToeCollectionViewCell(_ cell: TicTacToeCollectionViewCell, didCheckWith indexPath: IndexPath)
    func ticTacToeCollectionViewCell(_ cell: TicTacToeCollectionViewCell, didUncheckWith indexPath: IndexPath)
}

class TicTacToeCollectionViewCell: UICollectionViewCell, NibLoadableView, ReusableView, Identifiable {

    @IBOutlet weak var checkMarkButton: UIButton!

    var indexPath: IndexPath?
    var checked = false
    weak var delegate: TicTacToeCollectionViewCellDelegate?

//verificação se a checkmark estiver assinalada? talvez fazer um switch case se estiver com um valor

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(with item: XOrO, indexPath: IndexPath?) {
        self.indexPath = indexPath
        checkMarkButton.setTitle(item.checked ?? true ? "X" : "O", for: .normal)
    }
    
    @IBAction func didTapCheckMarkedButton() {
        guard let indexPath = self.indexPath else { return }
        if checked {
            delegate?.ticTacToeCollectionViewCell(self, didUncheckWith: indexPath)
        } else {
            delegate?.ticTacToeCollectionViewCell(self, didCheckWith: indexPath)
        }
    }
}
