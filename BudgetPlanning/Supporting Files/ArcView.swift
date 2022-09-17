//
//  ArcView.swift
//  BudgetPlanning
//
//  Created by mostafa elsanadidy on 17.09.22.
//

import Foundation
import UIKit

class ArcView: UIView {
    var startAngle: CGFloat = .pi * 3 / 4
    var endAngle: CGFloat = .pi * 5 / 4
    var clockwise: Bool = true

    /// Radius of center of this arc
    var radius: CGFloat = 100

    /// The linewidth of this thick arc
    var lineWidth: CGFloat = 50

    /// The corner radius of this thick arc
    var cornerRadius: CGFloat = 10

    static override var layerClass: AnyClass { return CAShapeLayer.self }
    var shapeLayer: CAShapeLayer { return layer as! CAShapeLayer }

    override func layoutSubviews() {
        super.layoutSubviews()
        updatePath()
    }

    func updatePath() {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let innerRadius = radius - lineWidth / 2 + cornerRadius
        let innerAngularDelta = asin(cornerRadius / innerRadius) * (clockwise ? 1 : -1)
        let outerRadius = radius + lineWidth / 2 - cornerRadius
        let outerAngularDelta = asin(cornerRadius / outerRadius) * (clockwise ? 1 : -1)

        let path = UIBezierPath(arcCenter: center, radius: innerRadius, startAngle: startAngle + innerAngularDelta, endAngle: endAngle - innerAngularDelta, clockwise: clockwise)
        path.addArc(withCenter: center, radius: outerRadius, startAngle: endAngle - outerAngularDelta, endAngle: startAngle + outerAngularDelta, clockwise: !clockwise)
        path.close()

        // configure shapeLayer

        shapeLayer.lineWidth = cornerRadius * 2
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineJoin = .round
        shapeLayer.path = path.cgPath
    }

}
