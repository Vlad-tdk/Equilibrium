//
//  ImageViewController.swift
//  Equilibrium
//
//  Created by Vlad on 5.6.23..
//

import UIKit

final class ImageViewController: UIViewController {
    
    @IBOutlet weak var collecttionView: UICollectionView!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    private var images = Resourses.Images.images
    private var pathCell = 0
    private var pathSelect = 2
    private var playPause = false

    override func viewDidLoad() {
        super.viewDidLoad()
        collecttionView.dataSource = self
        collecttionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
    }
        
    func tapObservers() {
        let doubleTap = UITapGestureRecognizer(
            target: self,
            action: #selector(doubleTapAction))
        
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap )
    }
    
    @objc func doubleTapAction() {
        collecttionView.isHidden.toggle()
        navigationController?.navigationBar.isHidden.toggle()
    }
}

extension ImageViewController: UICollectionViewDataSource,
                               UICollectionViewDelegate,
                               UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        
        if collectionView == imageCollectionView{
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Cell", for: indexPath) as! ImageViewCell
            if pathSelect != indexPath.item && pathSelect != pathCell{
                let b = images.remove(at: pathSelect)
                images.insert(b, at: indexPath.item)
                cell.imageViewCell.image = UIImage(
                    named: images[indexPath.item])
                pathCell = pathSelect

            } else {
                    cell.imageViewCell.image = UIImage(
                        named: images[indexPath.item])
            }
                return cell
        } else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "Cell2", for: indexPath) as! CellImage
            if pathSelect == indexPath.item {
                cell.layer.borderColor = CGColor(
                    red: 0,
                    green:0,
                    blue: 1,
                    alpha: 1
                )
                cell.layer.borderWidth = 5
            } else {
                cell.layer.borderColor = CGColor(
                    red: 0,
                    green: 0,
                    blue: 0,
                    alpha: 1
                )
                cell.layer.borderWidth = 3
            }
            cell.cellImage.image = UIImage(named: images[indexPath.item])
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collecttionView{
            return CGSize(width: 60, height: 110)
        } else {
            let cvRect = collectionView.frame
                    return CGSize(width: cvRect.width, height: cvRect.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        if collectionView == collecttionView {
            pathSelect = indexPath.item
            imageCollectionView.reloadData()
            collectionView.reloadData()
        } else {
            tapObservers()
        }
    }
}



