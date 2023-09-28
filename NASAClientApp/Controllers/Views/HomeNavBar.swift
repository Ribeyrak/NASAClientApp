//
//  navBarView.swift
//  NASAClientApp
//
//  Created by Evhen Lukhtan on 28.09.2023.
//

import UIKit
import SnapKit

class HomeNavBar: UIView {
    
    // MARK: - UI
    private lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.text = "MARS.CAMERA"
        v.textColor = .black
        v.font = .boldSystemFont(ofSize: 34)
        return v
    }()
    
    private lazy var dateLabel: UILabel = {
        let v = UILabel()
        v.text = "June 6, 2020"
        v.textColor = .black
        v.font = .systemFont(ofSize: 17, weight: .semibold)
        return v
    }()
    
    private lazy var calendarButton: UIButton = {
        let v = UIButton()
        v.setImage(UIImage(named: "Calen"), for: .normal)
        v.makeSystem(v)
        return v
    }()
    
    private lazy var roverButton: FilterButton = {
        let v = FilterButton()
        v.setTitleAndIcon(title: "All", image: "cpu1")
        return v
    }()
    
    private lazy var cameraButton: FilterButton = {
        let v = FilterButton()
        v.setTitleAndIcon(title: "All", image: "cam1")
        return v
    }()
    
    private lazy var addButton: FilterButton = {
        let v = FilterButton()
        v.setTitleAndIcon(title: nil, image: "add1")
        return v
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        bindUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        bindUI()
    }
    
    // MARK: - Private func
    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(19)
            $0.top.equalToSuperview().inset(2)
            $0.height.equalTo(42)
        }
        
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(19)
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.height.equalTo(22)
        }
        
        addSubview(calendarButton)
        calendarButton.snp.makeConstraints {
            $0.width.equalTo(44)
            $0.height.equalTo(44)
            $0.top.equalToSuperview().inset(19)
            $0.right.equalToSuperview().inset(17)
        }
        
        addSubview(roverButton)
        roverButton.snp.makeConstraints {
            $0.height.equalTo(38)
            $0.width.equalTo(140)
            $0.left.equalToSuperview().inset(20)
            $0.top.equalTo(dateLabel.snp.bottom).offset(22)
        }
        
        addSubview(cameraButton)
        cameraButton.snp.makeConstraints {
            $0.height.equalTo(38)
            $0.width.equalTo(140)
            $0.left.equalTo(roverButton.snp.right).offset(12)
            $0.top.equalTo(dateLabel.snp.bottom).offset(22)
        }
        
        addSubview(addButton)
        addButton.snp.makeConstraints {
            $0.height.width.equalTo(38)
            $0.right.equalToSuperview().inset(20)
            $0.top.equalTo(dateLabel.snp.bottom).offset(22)
        }
        
    }

    private func bindUI() {
        
    }

}
