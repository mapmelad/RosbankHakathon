//
//  StoriesViewController.swift
//  RosbankHackathon
//
//  Created by Semyon on 17/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

class StoriesViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
    }
    
    private func registerCells() {
        let ticketsCell = UINib(nibName: "StoriesCollectionViewCell", bundle: nil)
        collectionView.register(ticketsCell, forCellWithReuseIdentifier: "StoriesCollectionViewCell")
    }
    
    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextStoriesAction(_ sender: Any) {
        let nextIndexPath = IndexPath(row: curentCell() + 1, section: 0)
        if nextIndexPath.row < 3 {
            collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func previeStoriesAction(_ sender: Any) {
        let previeIndexPath = IndexPath(row: curentCell() - 1, section: 0)
        if previeIndexPath.row >= 0 {
            collectionView.scrollToItem(at: previeIndexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    private func curentCell() -> Int {
        let currentPage = Int(collectionView.contentOffset.x / collectionView.frame.width)
        return currentPage
    }
}


extension StoriesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width: screenWidth, height: screenSize.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: StoriesCollectionViewCell = collectionView.dequeueReusableCell(at: indexPath)
        
        return cell
    }
    
}
