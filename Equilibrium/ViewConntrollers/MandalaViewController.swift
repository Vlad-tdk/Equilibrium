//
//  MandalaViewController.swift
//  Equilibrium
//
//  Created by Vlad on 19.9.23..
//

import UIKit

final class MandalaViewController: UIViewController {
    
    @IBOutlet weak var mandalaImage: UIImageView!
    @IBOutlet weak var mandalaCollectionView: UICollectionView!
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var centrButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var stackViewButtton: UIStackView!
    
    private var animationStarted = false
    private var mandalaAnimation = true
    private let images = Resourses.Images.mandalaImages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mandalaCollectionView.dataSource = self
        mandalaCollectionView.delegate = self
        centrButton.isEnabled = false
    }
    
    @IBAction func descriptionAction() {
        alertClue(Resourses.Description.titleMandala,
                  Resourses.Description.messageMandala)
    }
    @IBAction func rotationSideAction(_ sender: UIButton) {
        switch sender{
        case leftButton:
            mandalaAnimation = false
            leftButton.isEnabled = false
            rightButton.isEnabled = true
            centrButton.isEnabled = true
        case rightButton:
            mandalaAnimation = true
            rightButton.isEnabled = false
            leftButton.isEnabled = true
            centrButton.isEnabled = true
        default:
            rightButton.isEnabled = true
            leftButton.isEnabled = true
            centrButton.isEnabled = false
            mandalaAnimation = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        mandalaCollectionView.isHidden.toggle()
        navigationController?.navigationBar.isHidden.toggle()
        stackViewButtton.isHidden.toggle()
        animationStarted.toggle()
        if animationStarted && centrButton.isEnabled{
            mandalaImage.rotateView(mandalaAnimation)
        } else {
            mandalaImage.layer.removeAllAnimations()
        }
    }
}
extension MandalaViewController: UICollectionViewDataSource,
                                 UICollectionViewDelegate,
                                 UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MandalaCell", for: indexPath
                                                     ) as! MandalaViewCell
        cell.mandalaImage.image = UIImage(
            named: images[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        mandalaImage.image = UIImage(named: images[indexPath.item])
    }
}



