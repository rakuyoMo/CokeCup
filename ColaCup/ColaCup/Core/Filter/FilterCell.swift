//
//  FilterCell.swift
//  ColaCup
//
//  Created by Rakuyo on 2021/9/27.
//  Copyright © 2021 Rakuyo. All rights reserved.
//

import UIKit

public class FilterCell: UICollectionViewCell {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        config()
    }
    
    public var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont.preferredFont(forTextStyle: .body)
        
        if #available(iOS 13.0, *) {
            label.textColor = .label
        } else {
            label.textColor = .black
        }
        
        return label
    }()
}

public extension FilterCell {
    func setSelected(_ isSelected: Bool) {
        layer.borderColor = isSelected ? UIColor.theme.cgColor : backgroundColor?.cgColor
    }
}

private extension FilterCell {
    func config() {
        if #available(iOS 13.0, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .white
        }
        
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = backgroundColor?.cgColor
        
        addSubviews()
        addInitialLayout()
    }
    
    func addSubviews() {
        addSubview(label)
    }
    
    func addInitialLayout() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}