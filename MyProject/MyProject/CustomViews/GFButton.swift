//
//  GFButton.swift
//  MyProject
//
//  Created by Nagarro on 2024/07/19.
//
// Custom button

import UIKit

// Custom UIButton class for a styled button with initializers for configuration
class GFButton: UIButton {
    
    // Default initializer for creating the button programmatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Custom code to build on existing object inherits parent class
        configure()
    }
    
    // Required initializer for creating the button from a storyboard or xib
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Convenience Custom initializer for setting the background color and title
    // This initializer can be used when creating buttons dynamically in code
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        // Set the background color of the button
        self.backgroundColor = backgroundColor
        // Set the title of the button
        self.setTitle(title, for: .normal)
        // Call the configure method to set up additional properties
        configure()
    }
    
    // Private method to configure the appearance and properties of the button
    private func configure() {
        // Set the corner radius to make the button's corners rounded
        layer.cornerRadius = 10
        // Set the title color to white for the normal state
        setTitleColor(.white, for: .normal)
        // Set the font to the preferred font for the headline text style
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        // Disable autoresizing mask translation to use Auto Layout
        // This is important for dynamic views where constraints are used
        translatesAutoresizingMaskIntoConstraints = false
    }
}
