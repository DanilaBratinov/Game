import UIKit

class SettingViewController: UIViewController {
    
    private let logic = Game.shared
//  MARK: - IBOutlets
    @IBOutlet var settingButtonsOutlet: [UIButton]!
    
//    MARK: - IBActions
    @IBAction func settingButtons(_ sender: UIButton) {
        sender.pulsate()
        settingButtonsOutlet.forEach { button in
            button.isSelected = false
        }
        sender.isSelected.toggle()
        
        switch sender.tag {
        case 0:
            return
        case 1:
            return
        default:
            return
        }
    }
    
    
    
    
    
    
    
}

