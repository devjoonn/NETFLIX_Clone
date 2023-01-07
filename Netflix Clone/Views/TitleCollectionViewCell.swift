//
//  TitleCollectionViewCell.swift
//  Netflix Clone
//
//  Created by 박현준 on 2023/01/05.
//

import UIKit
import SDWebImage

//HomeVIew
class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    // 셀이보여지면 이 함수가 호출됨
    public func configure(with model: String) {
        // 홈뷰컨트롤러에 각 셀들에게 보여질 포스터 url
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else { return }
        posterImageView.sd_setImage(with: url, completed: nil)
//        print(url)
    }
}
