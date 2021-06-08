//
//  ViewController.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var newsCompLayout = NewsCompositionalLayout()
    private lazy var dataSource = makeDataSource()
    
    var viewModel: TrendingNewsViewModel
    
    var newsArticles: [NewsArticleViewModel] = [] {
        didSet {
            self.updateDataSource()
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: newsCompLayout.layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(NewsArticleCollectionViewCell.self, forCellWithReuseIdentifier: NewsArticleCollectionViewCell.cellId)
        return collectionView
    }()
    
    init(viewModel: TrendingNewsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setup()
        viewModel.didUpdateNews = { [weak self] articles in
            guard let strongSelf = self else { return }
            strongSelf.newsArticles = articles
        }
        viewModel.fetchNewsArticles()
        updateDataSource()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Latest news"
    }
}

private extension ViewController {
    
    func setup() {
        view.backgroundColor = .green
        collectionView.dataSource = dataSource
        addCollectionView()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    func makeDataSource() -> UICollectionViewDiffableDataSource<Section, NewsArticleViewModel> {
        return UICollectionViewDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsArticleCollectionViewCell.cellId, for: indexPath) as! NewsArticleCollectionViewCell
            cell.articleNameLabel.text = item.articleTitle
            cell.backgroundColor = .red
            return cell
        }
    }
    
    func updateDataSource(animated: Bool = true) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            var snapshot = NSDiffableDataSourceSnapshot<Section, NewsArticleViewModel>()
            snapshot.appendSections([.main])
            snapshot.appendItems(self.newsArticles)
            self.dataSource.apply(snapshot, animatingDifferences: animated)
        }
    }
    
}

extension ViewController {
    fileprivate enum Section {
        case main
    }
}
