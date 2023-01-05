//
//  CollectionViewTableViewCell.swift
//  Netflix Clone
//
//  Created by 박현준 on 2023/01/04.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableViewCell"
    
    //해당 배열 초기화
    private var titles: [Title] = [Title]()
    
    private let collectionView: UICollectionView = {
        
        //컬렉션뷰 레이아웃 잡음
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //셀당 사이즈 설정
        layout.itemSize = CGSize(width: 140, height: 200)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //이코드가 없으면 셀이 화면에 안보여짐
        collectionView.frame = contentView.bounds
    }
    
    // 컬렉션뷰에 대한 셀의 이름을 배열로 추가
    public func configure(with title: [Title]) {
        self.titles = title
        // 컨트롤러 선택 이후 titles 에 배열이 업데이트되어 다시 비동기로 데이터 업데이트함
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        //        cell.backgroundColor = .green
        //        return cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else { return UICollectionViewCell() }
        
        //TitleCollectionViewCell 에 있는 public configure메서드로 셀에 들어갈 포스터 이미지의 URL을 적용시킴
        guard let model = titles[indexPath.row].poster_path else { return UICollectionViewCell() } //현재 model 은 옵셔널 스트링 값
        cell.configure(with: model)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
        
    
}
