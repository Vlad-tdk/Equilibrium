//
//  MainViewController.swift
//  Equilibrium
//
//  Created by Vlad on 11.9.23..
//

import UIKit

class MainViewController: UICollectionViewController {
    

    
    private let userActions = Resourses.UserAction.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .white
        view.setVerticalGradient()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return userActions.count
        }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "cell", for: indexPath) as! MainViewCell
            
            cell.setVerticalGradientLayer()
            cell.contentView.layer.cornerRadius = cell.mainViewCell.frame.width / 2
            
            cell.layer.borderWidth = 1
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 2, height: 3)
            cell.layer.shadowRadius = 7
            cell.layer.shadowOpacity = 0.5
            cell.layer.masksToBounds = false
            cell.layer.cornerRadius = cell.mainViewCell.frame.width / 2
            
            cell.mainLabelCell.textColor = .black
            cell.mainLabelCell.text = userActions[indexPath.item].rawValue
            cell.mainViewCell.layer.cornerRadius = cell.mainViewCell.frame.width / 2
            
            cell.mainViewCell.image = UIImage(
                named: Resourses.Images
                    .imagesMain[indexPath.item])
            return cell
        }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            let userAction = userActions[indexPath.item]
            
            switch userAction {
            case .breath: performSegue(withIdentifier: "breath", sender: nil)
            case .mandala: performSegue(withIdentifier: "mandala", sender: nil)
            case .showImage: performSegue(withIdentifier: "image", sender: nil)
            case .fireGif: performSegue(withIdentifier: "FairImageMeditation", sender: nil)
            case .about: performSegue(withIdentifier: "about", sender: nil)
                
            }
        }
    
    @IBAction func playStarted(_ sender: UIButton) {
        if sender.titleLabel?.text == "Play Music"{
            sender.setTitle("Stop Music", for: .normal)
            
            Player.defaultPlayer().audior?.play()
        }else {
            sender.setTitle("Play Music", for: .normal)
            Player.defaultPlayer().audior?.stop()
        }
    }
    
    
}


// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: UIScreen.main.bounds.width - 48, height: 67)
    }
}
