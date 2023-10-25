//
//  ViewController.swift
//  Equilibrium
//
//  Created by Vlad on 20.9.23..
//

import UIKit
import AVFoundation

final class FireMeditationController: UIViewController {

    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let imagesGif = Resourses.Images.gifImages
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        gifImage.image = UIImage.gif(name: "sv")

    }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        collectionView.isHidden.toggle()
        navigationController?.navigationBar.isHidden.toggle()
    }
    
    @IBAction func descriptionFireAction(_ sender: Any) {
        alertClue(Resourses.Description.titleFire,
                  Resourses.Description.messageFire)
    }
    
}
extension FireMeditationController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return imagesGif.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "FireViewCell", for: indexPath) as! FireViewCell
        cell.imageFire.image = UIImage.gif(name: imagesGif[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        gifImage.image = UIImage.gif(name: imagesGif[indexPath.item])
    }
}
