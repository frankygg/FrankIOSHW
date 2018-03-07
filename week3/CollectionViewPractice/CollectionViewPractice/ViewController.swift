//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by BoTingDing on 2018/3/7.
//  Copyright © 2018年 BoTingDing. All rights reserved.
//

import UIKit


fileprivate let reuseIdentifier = "collection_cell"
fileprivate let screenWidth = UIScreen.main.bounds.width

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var resultlabel: UILabel!
    
    var showlabel: String = ""
    
    var diceRoll = Int(arc4random_uniform(100)) + 1
    
    var guessLowerBound: Int = 1
    var guessUpperBound: Int  = 100
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionViewCells()
        
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        print("\(diceRoll)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Setup
    
    func setupCollectionViewCells() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
        let padding: CGFloat = 10
        let itemWidth = screenWidth/3 - padding
        let itemHeight = screenWidth/3 - padding
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        myCollectionView.collectionViewLayout = layout
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MyCollectionViewCell else { fatalError() }
        
        cell.titleLabel.text = "\(indexPath.row)"
        cell.titleLabel.textAlignment = .center
        cell.titleLabel.textColor = .white
        let lineColor = UIColor.white
        cell.contentView.layer.borderColor = lineColor.cgColor
            cell.contentView.layer.borderWidth = 2.0
        cell.contentView.layer.cornerRadius = (screenWidth/3 - 10) / 2
        cell.contentView.layer.masksToBounds = true;
        
        cell.contentView.backgroundColor = UIColor(red: 27/255.0, green: 32/255.0, blue: 36/255.0, alpha: 1.0)
        
        switch indexPath.row {
        case 9: cell.titleLabel.text = "0"
        case 10: cell.titleLabel.text = "取消"
        case 11: cell.titleLabel.text = "送出"
        default:cell.titleLabel.text = "\(indexPath.row + 1)"
        }
        

        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateCell(having: indexPath, selected: true)
        updateLabel(withButton: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        updateCell(having: indexPath, selected: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        updateCell(having: indexPath, selected: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        updateCell(having: indexPath, selected: false)
    }
    
    func updateCell(having indexPath: IndexPath, selected: Bool) {
        
        let selectedBackgroundColor = UIColor(red: 41/255.0, green: 211/255.0, blue: 241/255.0, alpha: 1.0)
        let defaultBackgroundColor = UIColor(red: 27/255.0, green: 32/255.0, blue: 36/255.0, alpha: 1.0)
        
        if let cell = myCollectionView.cellForItem(at: indexPath) {
            cell.contentView.backgroundColor = selected ? selectedBackgroundColor : defaultBackgroundColor
        }
    }
    
    func updateLabel(withButton: Int) {
        switch withButton {
        case 10: showlabel = "請輸入數字"
        case 11: showlabel = calculateResult(showlabel)
        case 9: if((Int(showlabel)) != nil) {
            showlabel += String(0)
        } else {
            showlabel = String(0)
            }
        default:if((Int(showlabel)) != nil) {
            showlabel += String(withButton + 1)
        }else {
            showlabel = String(withButton + 1)
        }
        }
        resultlabel.text = showlabel
    }
    
    func calculateResult(_ withValue: String) -> String {
        guard let guess = Int(withValue), guess <= 100 && guess > 0 else {
            return "輸入須介於1 ~ 100"
        }
        if(guess > diceRoll) {
            guessUpperBound = guess
            return "\(guessLowerBound) ~ \(guess)"
        } else if guess < diceRoll {
            guessLowerBound = guess
            return "\(guess) ~ \(guessUpperBound)"
        }else {
            diceRoll = Int(arc4random_uniform(100)) + 1
            print("\(diceRoll)")
            guessUpperBound = 100
            guessLowerBound = 1
            return "GAME OVER"
        }
    }
    
}

