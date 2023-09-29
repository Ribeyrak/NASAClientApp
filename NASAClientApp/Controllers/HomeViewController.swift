//
//  HomeViewController.swift
//  NASAClientApp
//
//  Created by Evhen Lukhtan on 27.09.2023.
//

import UIKit
import SnapKit
import Alamofire

enum RoversName {
    static let curiosity = "curiosity"
    static let opportunity = "opportunity"
    static let spirit = "spirit"
}

enum CameraNames: String, CaseIterable {
    case fhaz = "FHAZ"
    case rhaz = "RHAZ"
    case mast = "MAST"
    case chemcam = "CHEMCAM"
    case mahli = "MAHLI"
    case mardi = "MARDI"
    case navcam = "NAVCAM"
    case pancam = "PANCAM"
    case minites = "MINITES"
}

class HomeViewController: UIViewController {
    
    // MARK: - UI
    @IBOutlet weak var navBarView: HomeNavBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var historyBtnView: UIView!
    
    private lazy var historyButton: UIButton = {
        let v = UIButton()
        v.setImage(UIImage(named: "History"), for: .normal)
        v.makeSystem(v)
        return v
    }()
    
    let key = "ZkmLlasPmsOCoItD1S3XoSqtgLzZPbngDKx4ZWGO"
    var camera: CameraNames?
    
    //let link = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2015-6-3&camera=FHAZ&page=1&api_key=ZkmLlasPmsOCoItD1S3XoSqtgLzZPbngDKx4ZWGO"
    
    var link = "https://api.nasa.gov/mars-photos/api/v1/rovers/spirit/photos?sol=1000&camera=NAVCAM&page=1&api_key=ZkmLlasPmsOCoItD1S3XoSqtgLzZPbngDKx4ZWGO"
    var data = [Photo]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindUI()
        getData()
        
        let baseLink = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2015-6-3&page=1&api_key=ZkmLlasPmsOCoItD1S3XoSqtgLzZPbngDKx4ZWGO"
        if let cameraNames = getCameraNames() {
            link = "\(baseLink)&camera=\(cameraNames)"
            print(link)
        } else {
            link = baseLink
        }
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
    }
    
    private func getData() {
        AF.request(link).response { response in
            let result = try! JSONDecoder().decode(PhotosResult.self, from: response.data!)
            self.data = result.photos ?? []
            self.tableView.reloadData()
        }
    }
    
    func getCameraNames() -> String? {
        if let camera = camera {
            return camera.rawValue
        } else {
            return CameraNames.allCases.map { $0.rawValue }.joined(separator: ",")
        }
    }
    
}

// MARK: - TableView DataSource
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        cell.setupCell(data: data[indexPath.section])
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
