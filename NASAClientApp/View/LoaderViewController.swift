//
//  ViewController.swift
//  NASAClientApp
//
//  Created by Evhen Lukhtan on 25.09.2023.
//

import UIKit
import Lottie
import SnapKit

class LoaderViewController: UIViewController {

    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var loaderGif: UIView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeAnimationLoader()
        setupUI()
        animationToScreen()
    }
    
    // MARK: - Private func
    private func setupUI() {
        iconView.layer.cornerRadius = 30
    }
    
    private func makeAnimationLoader() {
        let animationView = LottieAnimationView(name: "loaderGif")
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.loopMode = .loop
        animationView.play()
        
        loaderGif.addSubview(animationView)
        animationView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func animationToScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
            let navigationVC = UINavigationController(rootViewController: homeVC)
            navigationVC.setNavigationBarHidden(true, animated: false)
            navigationVC.modalPresentationStyle = .fullScreen
            self.present(navigationVC, animated: true, completion: nil)
        }
    }
    
}


