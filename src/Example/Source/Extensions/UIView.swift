import UIKit

extension UIView {

    enum Direction {
        case vertical, horizontal
    }

    func setGradient(
        colors: [CGColor] = [UIColor.blue.cgColor, UIColor.purple.cgColor],
        direction: Direction = .vertical
    ) {
        let gradient: CAGradientLayer = .init()
        gradient.frame = bounds
        gradient.colors = colors
        switch direction {
            case .vertical:
                gradient.startPoint = CGPoint(x: 0, y: 0)
                gradient.endPoint = CGPoint(x: 0, y: 1)
            case .horizontal:
                gradient.startPoint = CGPoint(x: 0, y: 0)
                gradient.endPoint = CGPoint(x: 1, y: 0)
        }
        layer.insertSublayer(gradient, at: 0)
    }
}
