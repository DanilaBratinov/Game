import UIKit

extension UILabel {
    func opacity() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.5
        layer.add(animation, forKey: nil)
    }
    
    func fadeIn() {
        let springAnimation = CASpringAnimation(keyPath: "transform.scale")
        springAnimation.fromValue = 0
        springAnimation.toValue = 1
        springAnimation.duration = 0.7
        springAnimation.damping = .greatestFiniteMagnitude.nextUp
        layer.add(springAnimation, forKey: nil)
    }
}
