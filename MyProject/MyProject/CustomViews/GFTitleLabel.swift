// This file defines a custom UILabel subclass named GFTitleLable.

// GFTitleLable.swift
// MyProject

// Created by Nagarro on 2024/07/22.

import UIKit

class GFTitleLable: UILabel {

  // This initializer is called when creating the label programmatically with a frame.
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  // This initializer is not implemented and will raise an error if you try to use it.
  // This is because we want to create GFTitlteLable programmatically with desired properties.
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // Convenience initializer that allows creating a GFTitleLable with text alignment and font size.
  // This initializer is likely used for creating the label programmatically with specific properties.
  convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
    self.init(frame: .zero) // Call the primary initializer with a zero frame (set later)
    self.textAlignment = textAlignment
    self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
  }

  // This private function configures the common properties of the label.
  // These properties are likely set to provide a consistent look and feel for titles throughout the app.
  private func configure() {
    textColor = .label // Use the system's label text color
    adjustsFontSizeToFitWidth = true // Reduce font size if text overflows the label's width
    minimumScaleFactor = 0.9 // Set the minimum scaling factor to prevent font size from becoming too small
    lineBreakMode = .byTruncatingTail // Truncate text with ellipsis (...) if it overflows on a single line
    translatesAutoresizingMaskIntoConstraints = false // Disable automatic translation constraints for programmatic layout
  }
}
