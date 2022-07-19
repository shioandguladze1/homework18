//
//  SecondViewController.swift
//  HM18 (shio andghuladze)
//
//  Created by shio andghuladze on 19.07.22.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var viewToScale: UIView!
    var navigationColor: NavigationColor?

    @objc func onLongPress(gesture: UILongPressGestureRecognizer){
        var startTime: Double = 0
        if gesture.state == .began{
            startTime = NSDate.timeIntervalSinceReferenceDate
        }
        if gesture.state == .ended{
            print("ended")
            let duration = NSDate.timeIntervalSinceReferenceDate - startTime
            unpressed(duration: duration)
        }
    }
    
    private func unpressed(duration: Double){
        if duration > 1 && navigationColor == .Red{
            navigationController?.popViewController(animated: true)
        }else if navigationColor == .Blue && duration > 1{
            UIView.transition(
                with: imageView, duration: 1,
                options: .transitionCrossDissolve,
                animations: { self.imageView.isHidden = true }
            )
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isUserInteractionEnabled = true
        let longClickGesture =         UILongPressGestureRecognizer(target: self, action: #selector(onLongPress))
        imageView.addGestureRecognizer(longClickGesture)
        imageView.image = UIImage(named: "Image")
        if navigationColor == .Purple {
            setSwipeGesture()
        }
    }
    
    private func setSwipeGesture(){
        let directions: [UISwipeGestureRecognizer.Direction] = [.left, .right, .up, .down]
        directions.forEach{ direction in
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe))
            gesture.direction = direction
            viewToScale.addGestureRecognizer(gesture)
        }
    }
    
    @objc func onSwipe(gesture: UISwipeGestureRecognizer){
        switch gesture.direction{
        case .left: viewToScale.transform =  viewToScale.transform.scaledBy(x: 0.5, y: 1)
        case .right: viewToScale.transform = viewToScale.transform.scaledBy(x: 1.5, y: 1)
        case .up: viewToScale.transform = viewToScale.transform.scaledBy(x: 1.5, y: 1)
        case .down: viewToScale.transform = viewToScale.transform.scaledBy(x: 0.5, y: 1)
        default: return
        }
    }
    
}

enum NavigationColor{
    case Red
    case Blue
    case Purple
}
