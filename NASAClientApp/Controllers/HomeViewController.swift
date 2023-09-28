//
//  HomeViewController.swift
//  NASAClientApp
//
//  Created by Evhen Lukhtan on 27.09.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    // MARK: - UI
    @IBOutlet weak var navBarView: HomeNavBar!
    @IBOutlet weak var tableView: UITableView! = {
        let v = UITableView(frame: .zero, style: .grouped)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.separatorStyle = .singleLine
        return v
    }()
    @IBOutlet weak var historyBtnView: UIView!
    private lazy var historyButton: UIButton = {
        let v = UIButton()
        v.setImage(UIImage(named: "History"), for: .normal)
        v.makeSystem(v)
        return v
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindUI()
        
    }
    
    // MARK: - Private func
    private func setupUI() {
        historyBtnView.addSubview(historyButton)
        historyButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(44)
        }
    }
    
    private func bindUI() {
        historyBtnView.makeSystem(historyButton)
        historyBtnView.layer.cornerRadius = 35
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        //tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

    }
    
}

// MARK: - TableView DataSource
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        15
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath)
        cell.backgroundColor = .yellow
        cell.layer.cornerRadius = 14
        
        let selected = UIView()
        selected.backgroundColor = UIColor.white
        selected.layer.cornerRadius = 14
        cell.selectedBackgroundView = selected
        
        return cell
    }
    
    
}

// MARK: - TableView Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0  // Здесь задается отступ между секциями
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()  // Возвращает пустое представление, чтобы создать отступ
    }
}
