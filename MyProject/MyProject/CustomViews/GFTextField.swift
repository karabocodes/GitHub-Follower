// This file defines a custom UITextField subclass named GFTextField.

import UIKit

class GFTextField: UITextField {

  // This initializer is called when creating the text field programmatically with a frame.
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  // This initializer is also supported for creating the text field from a storyboard or Xib file.
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }

  // This private function configures the common properties of the text field.
  // These properties likely provide a consistent look and feel for text fields throughout the app.
  private func configure() {
    // Set visual properties
    layer.cornerRadius = 10 // Apply rounded corners to the text field's border
    layer.borderWidth = 2 // Add a border around the text field
    layer.borderColor = UIColor.systemGray4.cgColor // Set the border color to a light gray

    // Set text properties
    textColor = .label // Use the system's label text color
    tintColor = .label // Use the system's label color for the cursor and selection highlight
    textAlignment = .center // Align text in the center of the text field
    font = UIFont.preferredFont(forTextStyle: .title2) // Use the system's preferred font for title2 text style (likely larger and bold)
    adjustsFontSizeToFitWidth = true // Reduce font size if text overflows the text field's width
    minimumFontSize = 12 // Set a minimum font size to prevent excessively small text

    // Set other properties
    backgroundColor = .tertiarySystemBackground // Use the system's tertiary background color
    autocorrectionType = .no // Disable autocorrection for this text field
    returnKeyType = .go // Set the return key type to "Go" (customizable behavior)
    isUserInteractionEnabled = true // Ensure the text field can be interacted with by the user

    placeholder = "Enter a movie name" // Set the placeholder text to guide the user

    // Disable automatic translation constraints for programmatic layout
    translatesAutoresizingMaskIntoConstraints = false
  }
}
