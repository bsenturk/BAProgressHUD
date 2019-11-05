//
//  BAProgressHUD.swift
//  BAProgressHUD
//
//  Created by Burak Şentürk on 5.11.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import Foundation
import UIKit

public class BAProgressHUD {

    public enum Style {
        case first
        case second
    }

    private var style: Style = .first

    public init(style: Style = .first) {
        self.style = style
    }

    private let containerView = UIView()

    private var hudColor = UIColor(red: 216/255, green: 31/255, blue: 38/255, alpha: 1)

    private var duration: CFTimeInterval = 0.75

    private let backgroundView = UIView()

    private let shapeLayer = CAShapeLayer()

    private let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")

    private let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")

    private func createHUD(view: UIView) {
        containerView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        containerView.backgroundColor = .clear
        containerView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)

        shapeLayer.path = UIBezierPath(ovalIn: CGRect(x: 0,
                                                      y: 0,
                                                      width: 50,
                                                      height: 50)).cgPath
        shapeLayer.strokeColor = hudColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5
        if style == .first {
            shapeLayer.strokeEnd = 0.5
        } else {
            shapeLayer.strokeEnd = 0.75
        }
        shapeLayer.lineCap = .square
        containerView.layer.addSublayer(shapeLayer)

        rotationAnimation.fromValue = 0
        rotationAnimation.duration = duration
        rotationAnimation.toValue = CGFloat(Double.pi * 2)
        rotationAnimation.repeatCount = .infinity
        containerView.layer.add(rotationAnimation, forKey: nil)

        scaleAnimation.fromValue = 1
        scaleAnimation.toValue = 0.5
        scaleAnimation.duration = duration / 2
        scaleAnimation.repeatCount = .infinity
        scaleAnimation.autoreverses = true
        containerView.layer.add(scaleAnimation, forKey: nil)
    }

    /**
     * Creates a new progress HUD and show in view
     *
     * - parameter view: The view that the HUD will be showed to
     */

    public func show(in view: UIView) {
        view.addSubview(containerView)
        createHUD(view: view)
    }

    /**
     * Create a new progress HUD and show in the view after delay
     * - parameter view: The view that the HUD will be showed to
     * - parameter delay: The delay that when HUD showed in the view
     */
    public func showAfterDelay(in view: UIView, delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.show(in: view)
        }
    }

    /**
     * Set duration of animation
     * - parameter duration: Duration of animation
     */

    public func setDuration(duration: CFTimeInterval) {
        self.duration = duration
        rotationAnimation.duration = duration
        scaleAnimation.duration = duration / 2
    }

    /**
     * Set color of HUD
     * - parameter color: The color that color of HUD
     */

    public func setColor(color: UIColor) {
        hudColor = color
        shapeLayer.strokeColor = color.cgColor
    }

    /**
     * Changes LineCap style of HUD
     * - parameter lineCap: LineCap style for endpoints for an open path when stroked
     */

    public func setLineCap(lineCap: CAShapeLayerLineCap) {
        shapeLayer.lineCap = lineCap
    }

    /**
     * Creates a HUD with background view.
     * - parameter view: The view that the HUD will be showed to
     */

    public func showWithBackgroundView(in view: UIView) {
        backgroundView.frame = view.bounds
        view.addSubview(backgroundView)
        backgroundView.addSubview(containerView)
        show(in: view)
    }

    /**
     * Creates a HUD with background view and show in the view after delay
     * - parameter view: The view that the HUD will be showed to
     * - parameter delay: The delay that when HUD showed in the view
     */

    public func showAfterDelayWithBackgroundView(in view: UIView, delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.showWithBackgroundView(in: view)
        }
    }

    /**
     * Set background color of background view
     * - parameter color: Color of background view
     */

    public func setBackgroundViewColor(color: UIColor) {
        backgroundView.backgroundColor = color
    }

    /**
     * Set alpha of background view
     * - parameter alpha: Alpha value of background view
     */

    public func setBackgroundViewAlpha(alpha: CGFloat) {
        backgroundView.alpha = alpha
    }

    /**
     * Remove HUD from its Superview
     */

    public func hide() {
        containerView.removeFromSuperview()
        backgroundView.removeFromSuperview()
    }

    /**
     * Remove HUD from its Superview after delay
     *
     * - parameter delay: The delay that when HUD removed from its Superview
     */

    public func hideAfterDelay(delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.containerView.removeFromSuperview()
            self.backgroundView.removeFromSuperview()
        }
    }

}

