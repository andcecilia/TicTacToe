//
//  TicTacToeViewController.swift
//  Tictactoe
//
//  Created by Cecilia Andrea Pesce on 20/09/22.
//

import Foundation
import UIKit

class TicTacToeViewController: UIViewController {
    
    @IBOutlet weak var playerTurnLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    private var gridSize: Int?
    var checkedList = [XOrOList]()
    var xItems = [Bool]()
    
    public func configure(with gridSize: Int?) {
            self.gridSize = gridSize
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        self.collectionView.backgroundColor = .cyan
        collectionView.register(TicTacToeCollectionViewCell.self)
        collectionView.dataSource = self
        }
           
    }

extension TicTacToeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let gridSize = gridSize else { return 3 }
        return gridSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        if let gridSize = gridSize {
        //
        //        }
        return CGSize(width: 100, height: 100)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return checkedList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itens = XOrO()
        checkedList = itens.checked
        var item = checkedList[indexPath.section].itens?[indexPath.row]
        if xItems.isEmpty {
            item?.checked = true
        }
        let cell = collectionView.dequeueReusableCell(for: indexPath) as TicTacToeCollectionViewCell
        cell.backgroundColor = .yellow
        if let item = item {
            cell.configure(with: item, indexPath: indexPath)
        }
        return cell
    }
}

extension TicTacToeViewController: TicTacToeCollectionViewCellDelegate {
    func ticTacToeCollectionViewCell(_ cell: TicTacToeCollectionViewCell, didCheckWith indexPath: IndexPath) {
        checkedList[indexPath.section].itens?[indexPath.row].checked = true
    }
    
    func ticTacToeCollectionViewCell(_ cell: TicTacToeCollectionViewCell, didUncheckWith indexPath: IndexPath) {
        checkedList[indexPath.section].itens?[indexPath.row].checked = false
    }
    
    
}
