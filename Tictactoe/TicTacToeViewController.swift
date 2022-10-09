//
//  TicTacToeViewController.swift
//  Tictactoe
//
//  Created by Cecilia Andrea Pesce on 20/09/22.
//

import Foundation
import UIKit

// tipos de estado possíveis que o botão pode ter
enum ItemState {
    case x
    case o
    case empty
}

//como se fosse uma model
struct Item {
    var state: ItemState = .empty
    var positionX: UInt
    var positionY: UInt
}

class TicTacToeViewController: UIViewController {
    
    @IBOutlet weak var playerTurnLabel: UILabel!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var fifthButton: UIButton!
    @IBOutlet weak var sixthButton: UIButton!
    @IBOutlet weak var seventhButton: UIButton!
    @IBOutlet weak var eighthButton: UIButton!
    @IBOutlet weak var ninthButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    private var matrixSize: Int?
    var isXturn = true
    var items: [Item] = []
    var buttons: [UIButton] = []
    var firstRow: [UIButton] = []
    var secondRow: [UIButton] = []
    var thirdRow: [UIButton] = []
    var itemState: ItemState = .x
    
    public func configure(with matrixSize: Int?) {
            self.matrixSize = matrixSize
    }
    
    func initMatrixItems(size: Int) {
        //TODO: objetivo é preencher o estado inicial com todos os itens, a posição deles e o estado vazio.
        // para o TODO: percorrer o array.
        // fazer um if para verificar se Items é vazio. Se for vazio preencher todos os states como .empty, e as posições serão preenchidas com o for aninhado.
        var positionX: UInt = 0
        var positionY: UInt = 0
        firstRow = [firstButton,
                    secondButton,
                    thirdButton]
        secondRow = [fourthButton,
                     fifthButton,
                     sixthButton]
        thirdRow = [seventhButton,
        eighthButton,
        ninthButton]
        
        //verifica se a struct Item está vazia.
        if items.isEmpty {
            //O for itera sob a lista de items pela quantidade de botões para adicionar o valor .empty ao state, e incrementa as posições x e y.
            for _ in 0..<firstRow.count {
                items.append(Item.init(state: .empty, positionX: positionX, positionY: positionY))
                positionY += 1
                print("posição do X: \(positionX)")
                print("posição do Y: \(positionY)")
            }
            
            
            positionY = 0
            for _ in 0..<secondRow.count {
                positionX = 1
                items.append(Item.init(state: .empty, positionX: positionX, positionY: positionY))
                positionY += 1
                print("posição do X: \(positionX)")
                print("posição do Y: \(positionY)")
            }
            
            positionY = 0
            for _ in 0..<thirdRow.count {
                positionX = 2
                items.append(Item.init(state: .empty, positionX: positionX, positionY: positionY))
                positionY += 1
                print("posição do X: \(positionX)")
                print("posição do Y: \(positionY)")
            }
            //print(items)
        }
        // para cada item na lista é verificado se o tipo de estado é case .empty. se for, para cada botão é colocado "-" como título.
        for item in items {
            if item.state == .empty {
                buttons.forEach({$0.setTitle("-", for: .normal)})
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [firstButton,
        secondButton,
        thirdButton,
        fourthButton,
        fifthButton,
        sixthButton,
        seventhButton,
        eighthButton,
        ninthButton]
        
        initMatrixItems(size: 3)
        }
    
    //sender serve para identificar qual o index daquele botão que foi clicado. é porque a função didTapButtons está sendo ligada a todos os botões. E para saber qual botão que foi clicado ela recebe como parâmetro o button.
    @IBAction func didTapButtons(_ sender: UIButton) {
        print(items)
        for item in items {
            switch item.state {
            case .x:
                //coisas
                //case bolinha
                isXturn = changePlayer(isXturn)
//                .forEach({$0.setTitle("-", for: .normal)})
            case .o:
                //set para o
                //mudar status para case x
                isXturn = changePlayer(isXturn)
            case .empty:
                //set title x
                //mudar status de empty para case bolinha
                for i in 0...buttons.count {
                    if sender.tag == i {
                        print(i)
                        buttons[i-1].setTitle(isXturn ? "X" : "O", for: .normal)
                    }
                }
                isXturn = changePlayer(isXturn)
//                setTitle("-", for: .normal)
            }
        }
        
        print("tocou")
        print(sender.tag)
        //verificar com um for para ver com a posição qual state, dependendo da vez colocar x ou o.
    }
    
    func changePlayer(_ isXturn: Bool) -> Bool {
        if isXturn {
            itemState = .o
            print(isXturn)
            return false
        } else {
            itemState = .x
            print(isXturn)
            return true
        }
    }
    
    }

    
    

