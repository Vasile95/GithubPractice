//
//  HighlightButton.swift
//  GithubPractice
//
//  Created by Elena Anghel on 3/17/21.
//
import UIKit

@IBDesignable
class HighlightButton: UIButton {
    var highlightDuration: TimeInterval = 0.25
    let cornerRadiusValue: CGFloat = 8
    
    @IBInspectable var normalBackgroundColor: UIColor?
    
    @IBInspectable var highlightedBackgroundColor: UIColor?
    
    override var isHighlighted: Bool {
        didSet {
            if oldValue == false && isHighlighted {
                highlight()
            } else if oldValue == true && !isHighlighted {
                unHighlight()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup(){
        layer.cornerRadius = cornerRadiusValue
    }
    
    func highlight() {
        animateBackground(to: highlightedBackgroundColor, duration: highlightDuration)
    }
    
    func unHighlight() {
        animateBackground(to: normalBackgroundColor, duration: highlightDuration)
    }
    
    private func animateBackground(to color: UIColor?, duration: TimeInterval) {
        guard let color = color else { return }
        UIView.animate(withDuration: highlightDuration) {
            self.backgroundColor = color
        }
    }
}
