//
//  GradiendBackground.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 25.02.2021.
//

import UIKit

class GradiendBackground: UIView {
    
    override class var layerClass: AnyClass{
        
        return CAGradientLayer.self
    }
    
    //MARK: - Вычисляемая переменная для удобной работы со слоем? Хз
    var gradientLayer: CAGradientLayer {
        
            return self.layer as! CAGradientLayer
        }
    
    var startColor = UIColor(red: 0/255, green: 14/255, blue: 36/255, alpha: 1){
    didSet {
            self.updateColors()
        }
}

    var endColor = UIColor(red: 50/255, green: 2/255, blue: 68/255, alpha: 1){
        didSet {
            self.updateColors()
            }
    }
    var startLocation:CGFloat = 0
    {
    didSet {
        self.updateLocation()
        }
}
    var endLocation: CGFloat = 1{
        didSet {
            self.updateLocation()
            }
    }
    var startPoint:CGPoint = .zero{
        didSet {
            self.updateStartPoint()
            }
    }
    var endPoint:CGPoint = CGPoint(x: 0, y: 1){
        didSet {
            self.updateEndPoint()
            }
    }
    
    func updateLocation () {
        
        self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
    }
    
    func updateColors () {
        
        self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
    }
    
    func updateStartPoint () {
        self.gradientLayer.startPoint = startPoint
    }
    
    func updateEndPoint () {
        self.gradientLayer.endPoint = endPoint
    }
    
 

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
