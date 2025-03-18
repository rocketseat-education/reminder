//
//  ToggleCheckbox.swift
//  ExampleCore
//
//  Created by Arthur Rios on 28/02/25.
//

import Foundation
import UIKit

class ToggleCheckbox: UIButton {
    private var isChecked: Bool = false
    private let checkedImage = UIImage(named: "checkedCheckbox")
    private let uncheckedImage = UIImage(named: "uncheckedCheckbox")
    
    init() {
        super.init(frame: .zero)
        self.setImage(uncheckedImage, for: .normal)
        self.addTarget(self, action: #selector(toggle), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func toggle() {
        isChecked.toggle()
        self.setImage(isChecked ? checkedImage : uncheckedImage, for: .normal)
    }
    
    public func getIsCheckedState() -> Bool {
        return isChecked
    }
}
