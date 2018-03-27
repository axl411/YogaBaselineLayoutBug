//
//  ViewController.swift
//  YogaBaselineLayoutBug
//
//  Created by Gu Chao on 2018/03/27.
//

import UIKit
import YogaKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.configureLayout { (layout) in
            layout.isEnabled = true
        }

        let container = UIView()
        view.addSubview(container)
        container.backgroundColor = .black
        container.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexDirection = .column
            layout.position = .absolute
            layout.top = 100
            layout.bottom = 100
            layout.left = 25
            layout.right = 25
        }

        addNormalTextBlock(container: container)
        addBugTextBlock(container: container)

        view.yoga.applyLayout(preservingOrigin: false)
    }

    func addNormalTextBlock(container: UIView) {
        let title = UILabel()
        container.addSubview(title)
        title.text = "This is normal ⬇️"
        title.textColor = .white
        title.configureLayout { (layout) in
            layout.isEnabled = true
        }

        let innerContainer = UIView()
        container.addSubview(innerContainer)
        innerContainer.backgroundColor = .brown
        innerContainer.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexDirection = .row
        }

        let labelA = UILabel()
        innerContainer.addSubview(labelA)
        labelA.text = "薔薇\n薔薇\n薔薇"
        labelA.numberOfLines = 0
        labelA.textColor = .white
        labelA.font = UIFont.systemFont(ofSize: 35)
        labelA.configureLayout { (layout) in
            layout.isEnabled = true
        }

        let labelB = UILabel()
        innerContainer.addSubview(labelB)
        labelB.text = "ÿM"
        labelB.textColor = .white
        labelB.font = UIFont.systemFont(ofSize: 74)
        labelB.configureLayout { (layout) in
            layout.isEnabled = true
        }
    }

    func addBugTextBlock(container: UIView) {
        let title = UILabel()
        container.addSubview(title)
        title.text = "This is bug ⬇️ (Height of blue container should adapt to impact caused by baseline alignment)"
        title.numberOfLines = 0
        title.textColor = .white
        title.configureLayout { (layout) in
            layout.isEnabled = true
        }

        let innerContainer = UIView()
        container.addSubview(innerContainer)
        innerContainer.backgroundColor = .blue
        innerContainer.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexDirection = .row
            layout.alignItems = .baseline
        }

        let labelA = UILabel()
        innerContainer.addSubview(labelA)
        labelA.text = "薔薇\n薔薇\n薔薇"
        labelA.numberOfLines = 0
        labelA.textColor = .white
        labelA.font = UIFont.systemFont(ofSize: 35)
        labelA.configureLayout { (layout) in
            layout.isEnabled = true
        }

        let labelB = UILabel()
        innerContainer.addSubview(labelB)
        labelB.text = "ÿM"
        labelB.textColor = .white
        labelB.font = UIFont.systemFont(ofSize: 74)
        labelB.configureLayout { (layout) in
            layout.isEnabled = true
        }
    }

}

