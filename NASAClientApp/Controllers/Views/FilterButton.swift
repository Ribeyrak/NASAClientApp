//
//  FilterButton.swift
//  NASAClientApp
//
//  Created by Evhen Lukhtan on 28.09.2023.
//

import UIKit
import SnapKit

final class FilterButton: UIButton {
    
    private let label: UILabel = {
        let label = UILabel()
        //label.text = "All"
        return label
    }()
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        bindUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        bindUI()
    }
    
    func setTitleAndIcon(title: String?, image: String) {
        label.text = title
        iconView.image = UIImage(named: image)
    }
}

private extension FilterButton {
    func setupUI() {
        addSubview(iconView)
        iconView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
            $0.left.equalToSuperview().inset(7)
        }
        
        addSubview(label)
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(iconView.snp.right).offset(10)
        }

    }
    
    func bindUI() {
        backgroundColor = .white
        layer.cornerRadius = 10
        makeSystem(self)
    }
}
