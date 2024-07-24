//
//  FollowerCollectionViewCell.swift
//  MyProject
//
//  Created by Nagarro on 2024/07/22.
//
import UIKit

class FollowerCollectionViewCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let movieNameLabel = GFTitleLable(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        movieNameLabel.text = follower.login
        avatarImageView.downloadImage(fromURL: follower.avatarUrl)
    }
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(movieNameLabel)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            movieNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            movieNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            movieNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            movieNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
