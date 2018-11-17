//
//  RequestsFeedViewController.swift
//  RosbankHackathon
//
//  Created by Semyon on 17/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

class RequestsFeedViewController: UIViewController {
    
    @IBOutlet var headerView: MainHeaderView!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         //headerView.setup(with: "Запросы")
        //Not work
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        // Do any additional setup after loading the view.
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = CGSize(width: 1,height: 1)
//        }
    }
    

    private func registerCells() {
        let ticketsCell = UINib(nibName: "RequestsCollectionViewCell", bundle: nil)
        collectionView.register(ticketsCell, forCellWithReuseIdentifier: "RequestsCollectionViewCell")
    }

}

extension RequestsFeedViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RequestsCollectionViewCell", for: indexPath) as! RequestsCollectionViewCell
        return cell
    }
    
}


extension RequestsFeedViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width: screenWidth, height: 120)
    }
    
}
