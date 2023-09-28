//
//  UIView + Ext.swift
//  NASAClientApp
//
//  Created by Evhen Lukhtan on 28.09.2023.
//

import UIKit

extension UIView {
    func makeSystem(_ botton: UIButton) {
        
        botton.addTarget(self, action: #selector(hendleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        
        botton.addTarget(self, action: #selector(hendleOut), for: [
            .touchUpInside,
            .touchDragOutside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc func hendleIn() {
        UIView.animate(withDuration: 0.15) { self.alpha = 0.55 }
    }
    
    @objc func hendleOut() {
        UIView.animate(withDuration: 0.15) { self.alpha = 1 }
    }
}
