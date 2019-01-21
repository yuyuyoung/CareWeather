//
//  AnimationTransitions.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/7/30.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit

class AnimationTransitions: NSObject, UIViewControllerAnimatedTransitioning {
    
    var operation: UINavigationControllerOperation = .none
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containView = transitionContext.containerView
        
        if operation == .push {
            let toView = transitionContext.view(forKey: .to)
            let vc = transitionContext.viewController(forKey: .to)
            vc?.updateViewConstraints()
            
            guard let to = toView else { return }
            
            to.alpha = 0
            containView.addSubview(to)
            
            UIView.animate(withDuration: 0.35, animations: {
                to.alpha = 1
            }) { (Compelet) in
                
                let isCancelled = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!isCancelled)
            }
        }else if operation == .pop {
            let fromView = transitionContext.view(forKey: .from)
            guard let from = fromView else { return }
            
            let toView = transitionContext.view(forKey: .to)
            guard let to = toView else { return }
            to.alpha = 0;
            
            containView.addSubview(to)
            UIView.animate(withDuration: 0.35, animations: {
                from.alpha = 0
                to.alpha = 1
            }) { (Compelet) in
                
                from.removeFromSuperview()
                let isCancelled = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!isCancelled)
            }
        }
    }
    

}
