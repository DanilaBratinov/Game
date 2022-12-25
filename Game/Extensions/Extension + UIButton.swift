import UIKit

extension UIButton {
    func pulsate() {
        let springAnimation = CASpringAnimation(keyPath: "transform.scale")
        springAnimation.fromValue = 0.9
        springAnimation.toValue = 1
        springAnimation.duration = 0.5
        layer.add(springAnimation, forKey: nil)
    }
}
