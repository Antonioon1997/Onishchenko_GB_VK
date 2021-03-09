//
//  FlippingScreenAnimation.swift
//  Onishchenko_GB_VK
//
//  Created by Onishchenko Anton on 15.03.2021.
//

import UIKit

class FlippingScreenAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    private var timeInterval:TimeInterval = 1
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return timeInterval
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard  let sourceController = transitionContext.viewController(forKey: .from),
               let destinationController = transitionContext.viewController(forKey: .to)
        else { return }
        transitionContext.containerView.addSubview(destinationController.view)
        destinationController.view.frame = sourceController.view.frame.insetBy(dx: sourceController.view.frame.width, dy: sourceController.view.frame.height)
        UIView.animate(withDuration: timeInterval, animations: {
            destinationController.view.frame = sourceController.view.frame
        }) { completed in
            transitionContext.completeTransition(completed)
        }

//        func viewController(forKey key: UITransitionContextViewControllerKey) -> UIViewController?
//        {
//            let
//        }
    }
    
    
}
