//
//  ViewController.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var newsCompLayout = NewsCompositionalLayout()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: newsCompLayout.layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        // Register cell
        return collectionView
    }()

    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Latest news"
    }
}

private extension ViewController {
    
    func setup() {
        view.backgroundColor = .green
        addCollectionView()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
}

extension ViewController {
    fileprivate enum Section {
        case main
    }
}
