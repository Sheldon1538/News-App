//
//  NewsArticleDetailsViewController.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import UIKit
import Nuke

class NewsArticleDetailsViewController: UIViewController {

    var article: NewsArticleViewModel!
    
    private lazy var sections = buildSections() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.cellId)
        collectionView.register(ArticleNameCollectionViewCell.self, forCellWithReuseIdentifier: ArticleNameCollectionViewCell.cellId)
        collectionView.register(ArticleDescriptionCollectionViewCell.self, forCellWithReuseIdentifier: ArticleDescriptionCollectionViewCell.cellId)
        return collectionView
    }()
    
    init(newsArticle: NewsArticleViewModel) {
        self.article = newsArticle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            let sectionType = self.sections[sectionNumber]
            return NewsArticleDetailsCompositionalLayout.createLayout(section: sectionType)
        }
    }
}

extension NewsArticleDetailsViewController {
    private func buildSections() -> [NewsArticleDetailsSection] {
        if article.imageURL == nil {
            return [.title, .description]
        } else {
            return [.image, .title, .description]
        }
    }
}

private extension NewsArticleDetailsViewController {
    
    func setup() {
        view.backgroundColor = #colorLiteral(red: 0.03453363478, green: 0.1120286658, blue: 0.3060317636, alpha: 1)
        title = article.articleTitle
        addCollectionView()
    }
    
    func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}

extension NewsArticleDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = sections[indexPath.section]
        switch sectionType {
        case .image:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.cellId, for: indexPath) as! ImageCollectionViewCell
            Nuke.loadImage(with: article.imageURL ?? "", into: cell.imageView)
            return cell
        case .title:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleNameCollectionViewCell.cellId, for: indexPath) as! ArticleNameCollectionViewCell
            cell.articleNameLabel.text = article.articleTitle
            return cell
        case .description:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleDescriptionCollectionViewCell.cellId, for: indexPath) as! ArticleDescriptionCollectionViewCell
            cell.articleDescriptionLabel.text = article.articleDescription
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
}

