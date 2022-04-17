//
//  CircleView.swift
//  ConcaveCollision
//
//  Created by Robert Ryan on 4/17/22.
//

import UIKit

class CircleView: UIView {
    var lineWidth: CGFloat = 3

    var shapeLayer: CAShapeLayer = {
        let _shapeLayer = CAShapeLayer()
        _shapeLayer.strokeColor = UIColor.blue.cgColor
        _shapeLayer.fillColor = UIColor.blue.withAlphaComponent(0.5).cgColor
        return _shapeLayer
    }()

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.addSublayer(shapeLayer)
        shapeLayer.lineWidth = lineWidth
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        shapeLayer.path = circularPath(lineWidth: lineWidth, center: center).cgPath
    }

    private func circularPath(lineWidth: CGFloat = 0, center: CGPoint = .zero) -> UIBezierPath {
        let radius = (min(bounds.width, bounds.height) - lineWidth) / 2
        return UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
    }

    override var collisionBoundsType: UIDynamicItemCollisionBoundsType { return .path }

    override var collisionBoundingPath: UIBezierPath { return circularPath() }
}
