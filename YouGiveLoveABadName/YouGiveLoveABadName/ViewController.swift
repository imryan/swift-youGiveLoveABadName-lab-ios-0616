//
//  ViewController.swift
//  YouGiveLoveABadName
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var topHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomHeightConstraint: NSLayoutConstraint!
    
    var initialConstant: CGFloat = 0
    
    var stretched: Bool {
        return (topHeightConstraint.constant > 470)
    }
    
    @IBAction func expandButtonTapped(sender: AnyObject) {
        if (!stretched) {
            expand()
        } else {
            shrink()
        }
    }
    
    func expand() {
        UIView.animateKeyframesWithDuration(0.4, delay: 0.0, options: .CalculationModePaced, animations: {
            self.view.layoutIfNeeded()
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1.0, animations: {
                self.topHeightConstraint.constant -= 50
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.2, animations: {
                self.topHeightConstraint.constant = (self.view.frame.size.height + 100)
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5, animations: {
                self.topHeightConstraint.constant -= 100
                self.view.layoutIfNeeded()
            })
            
            }, completion: { finished in
                if (finished) {
                    //
                }
        })
    }
    
    func shrink() {
        UIView.animateKeyframesWithDuration(0.4, delay: 0.0, options: .CalculationModePaced, animations: {
            self.view.layoutIfNeeded()
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1.0, animations: {
                self.topHeightConstraint.constant += 100
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.2, animations: {
                self.topHeightConstraint.constant = self.initialConstant
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5, animations: {
                self.topHeightConstraint.constant -= 50
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5, animations: {
                self.topHeightConstraint.constant = self.initialConstant
                self.view.layoutIfNeeded()
            })
            
            }, completion: { finished in
                if (finished) {
                    //
                }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bringSubviewToFront(button)
        
        initialConstant = topHeightConstraint.constant
    }
}

