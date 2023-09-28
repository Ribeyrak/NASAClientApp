//
//  HomeTableViewCell.swift
//  NASAClientApp
//
//  Created by Evhen Lukhtan on 28.09.2023.
//

import UIKit
import SnapKit

protocol ReusableViewCell: AnyObject {
    static var identifier: String { get }
}

class HomeTableViewCell: UITableViewCell {
    
    var nameCamera = "Front Hazard Avoidance Camera"
    // MARK: - UI
    private lazy var roverLabel: UILabel = {
        let v = UILabel()
        v.text = "Rover:"
        v.textColor = #colorLiteral(red: 0.6274510622, green: 0.6274510026, blue: 0.6274510026, alpha: 1)
        v.font = .systemFont(ofSize: 16)
        return v
    }()
    
    private lazy var roverNameLabel: UILabel = {
        let v = UILabel()
        v.text = "Curiosity"
        v.textColor = .black
        v.font = .boldSystemFont(ofSize: 16)
        return v
    }()
    
    private lazy var cameraLabel: UILabel = {
        let v = UILabel()
        v.text = "Camera:"
        v.textColor = #colorLiteral(red: 0.6274510622, green: 0.6274510026, blue: 0.6274510026, alpha: 1)
        v.font = .systemFont(ofSize: 16)
        v.numberOfLines = 2
        return v
    }()
    
    private lazy var cameraNameLabel: UILabel = {
        let v = UILabel()
        v.text = "Front Hazard Avoidance Camera"
        v.textColor = .black
        v.font = .boldSystemFont(ofSize: 16)
        v.numberOfLines = 2
        return v
    }()
    
    private lazy var dateLabel: UILabel = {
        let v = UILabel()
        v.text = "Date:"
        v.textColor = #colorLiteral(red: 0.6274510622, green: 0.6274510026, blue: 0.6274510026, alpha: 1)
        v.font = .systemFont(ofSize: 16)
        return v
    }()
    
    private lazy var date: UILabel = {
        let v = UILabel()
        v.text = "June 6, 2019"
        v.textColor = .black
        v.font = .boldSystemFont(ofSize: 16)
        return v
    }()
    
    private lazy var image: UIImageView = {
        let v = UIImageView()
        v.backgroundColor = .brown
        v.layer.cornerRadius = 20
        return v
    }()

    // MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupUI()
        nameCamera = cameraNameLabel.text ?? "hui"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    private func setupUI() {
        addSubview(image)
        image.snp.makeConstraints {
            $0.top.bottom.right.equalToSuperview().inset(10)
            $0.width.height.equalTo(130)
        }
        
        addSubview(roverLabel)
        roverLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(26)
        }
        addSubview(roverNameLabel)
        roverNameLabel.snp.makeConstraints {
            $0.left.equalTo(roverLabel.snp.right).offset(12)
            $0.top.equalToSuperview().inset(26)
        }
        
        addSubview(cameraLabel)
        cameraLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            //$0.right.equalTo(image.snp.left).offset(-10)
            $0.top.equalTo(roverLabel.snp.bottom).offset(8)
        }
        addSubview(cameraNameLabel)
        cameraNameLabel.snp.makeConstraints {
            $0.left.equalTo(cameraLabel.snp.right).offset(12)
            $0.top.equalTo(roverLabel.snp.bottom).offset(8)
            $0.right.equalTo(image.snp.left).offset(-10)
        }
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.top.equalTo(cameraNameLabel.snp.bottom).offset(8)
        }
        addSubview(date)
        date.snp.makeConstraints {
            $0.left.equalTo(dateLabel.snp.right).offset(12)
            $0.top.equalTo(cameraNameLabel.snp.bottom).offset(8)
        }
    
    }
    
    func setupCell() {
        layer.cornerRadius = 30
    }
}

// MARK: - extension
extension HomeTableViewCell: ReusableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
