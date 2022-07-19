//
//  ViewController.swift
//  HM18 (shio andghuladze)
//
//  Created by shio andghuladze on 19.07.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redView: UIButton!
    @IBOutlet weak var blueView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.layer.cornerRadius = 50
        blueView.layer.cornerRadius = 50
    }

    @IBAction func onTriangleclick(_ sender: Any) {
        navigate(identifier: "SecondViewController"){
            ($0 as? SecondViewController)?.navigationColor = .Purple
        }
    }
    
    @IBAction func onRedButtonClick(_ sender: Any) {
        navigate(identifier: "SecondViewController"){
            ($0 as? SecondViewController)?.navigationColor = .Red
        }
    }
    
    @IBAction func onBlueButtonClick(_ sender: Any) {
        navigate(identifier: "SecondViewController"){
            ($0 as? SecondViewController)?.navigationColor = .Blue
        }
    }
}

extension UIViewController{
    
    func navigate(identifier: String, closure: (UIViewController) -> Void = {_ in }){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: identifier)
        closure(controller)
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

