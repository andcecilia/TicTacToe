//
//  NibReusable.swift
//  Tictactoe
//
//  Created by Cecilia Andrea Pesce on 21/09/22.
//

import Foundation
import UIKit

protocol ReusableView: AnyObject {}
extension ReusableView where Self: UIView {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

protocol NibLoadableView: AnyObject {}
extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: Bundle.main)
    }
    
    static func loadFromBundle() -> Self? {
        guard let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)?[0] as? Self else {
            return nil
        }
        
        return view
    }
}
    

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_ :T.Type) where T:ReusableView, T:NibLoadableView {
        register(T.nib, forCellWithReuseIdentifier: T.reusableIdentifier)
    }
    
    func register<T: UICollectionViewCell>(_ :T.Type) where T:ReusableView {
        register(T.self, forCellWithReuseIdentifier: T.reusableIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T:ReusableView {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reusableIdentifier, for: indexPath) as? T else {
            fatalError("Could not possible to dequeue \(T.reusableIdentifier)")
        }
        
        return cell
    }
}
    
