//
//  ViewController.swift
//  ConcaveCollision
//
//  Created by Robert Ryan on 4/17/22.
//

import UIKit

class ViewController: UIViewController {
    private lazy var animator = UIDynamicAnimator(referenceView: view)
    private var points: [CGPoint] = []
    private let circleView = CircleView(frame: CGRect(origin: .zero, size: CGSize(width: 50, height: 50)))

    private let barrierLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.blue.cgColor
        layer.lineWidth = 2
        return layer
    }()
    private var path: UIBezierPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layer.addSublayer(barrierLayer)

        let tap = UITapGestureRecognizer(target: self, action: #selector(didHandleTap(_:)))
        view.addGestureRecognizer(tap)

        let pan = UIPanGestureRecognizer(target: self, action: #selector(didHandlePan(_:)))
        view.addGestureRecognizer(pan)
    }
}

// MARK: - Actions

extension ViewController {
    @objc func didHandleTap(_ gesture: UITapGestureRecognizer) {
        animator.removeAllBehaviors()

        circleView.center = gesture.location(in: gesture.view!)
        view.addSubview(circleView)

        for index in points.indices.dropFirst() {
            let path = UIBezierPath()
            path.move(to: points[index-1])
            path.addLine(to: points[index])

            let collision = UICollisionBehavior(items: [circleView])
            collision.addBoundary(withIdentifier: "\(index)" as NSString, for: path)
            animator.addBehavior(collision)
        }

        let gravity = UIGravityBehavior(items: [circleView])
        animator.addBehavior(gravity)
    }

    @objc func didHandlePan(_ gesture: UIPanGestureRecognizer) {
        let point = gesture.location(in: gesture.view!)
        switch gesture.state {
        case .began:
            points = [point]
            path = UIBezierPath()
            path?.move(to: point)

        case .changed:
            guard point != points.last else { return }
            points.append(point)
            path?.addLine(to: point)
            barrierLayer.path = path?.cgPath

        default:
            break
        }
    }
}

