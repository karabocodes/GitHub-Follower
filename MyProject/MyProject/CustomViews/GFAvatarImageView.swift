//
//  GFAvatarImageView.swift
//  MyProject
//
//  Created by Nagarro on 2024/07/22.
//

import UIKit

// Custom UIImageView class for displaying avatar images with a placeholder and download capability
class GFAvatarImageView: UIImageView {
    
    // Placeholder image to be used until the actual image is downloaded
    let placeholderImage = UIImage(named: "logo")!

    // Initializer for creating the image view programmatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    // Required initializer for creating the image view from a storyboard or xib
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Private method to configure the appearance and properties of the image view
    private func configure() {
        // Set the corner radius to make the image view's corners rounded
        layer.cornerRadius = 10
        // Ensure the image view clips to its bounds to apply the corner radius
        clipsToBounds = true
        // Set the initial image to the placeholder
        image = placeholderImage
        // Disable autoresizing mask translation to use Auto Layout
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Method to download an image from a given URL string
    func downloadImage(fromURL urlString: String) {
        // Ensure the URL string can be converted to a URL object
        guard let url = URL(string: urlString) else { return }
        
        // Create a data task to download the image
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            // Ensure self is not nil and handle potential error
            guard let self = self else { return }
            if error != nil { return }
            // Ensure the response is valid and the status code is 200 (OK)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            // Ensure data is not nil
            guard let data = data else { return }
            // Ensure the data can be converted to a UIImage
            guard let image = UIImage(data: data) else { return }
            
            // Update the image view on the main thread
            DispatchQueue.main.async {
                self.image = image
            }
        }
        
        // Start the data task
        task.resume()
    }
}
