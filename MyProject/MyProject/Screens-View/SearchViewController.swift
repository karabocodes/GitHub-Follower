//
//  SearchViewController.swift
//  MyProject
//
//  Created by Nagarro on 2024/07/19.
//

import UIKit

class SearchViewController: UIViewController {
    
    let logoImageView = UIImageView()
    let movieNametextfield = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Movie")
    
    var isMovieNameEntered: Bool {
        return !movieNametextfield.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextfield()
        configureCallToActionButton()
        createDissmisssKeyboardTapGesture()
        
    }
    
    
    //dismmis keybard
    func createDissmisssKeyboardTapGesture (){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC(){
        
        guard isMovieNameEntered else { 
            presentGFAlertOnMainThread(title: "Empty Movie Name", message: "Please insert a valid mobie name😇", buttonTitle: "OK")
            return
            }
        let followerListVC = FollowerListViewController()
        followerListVC.movieName = movieNametextfield.text
        followerListVC.title = movieNametextfield.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant:  200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextfield() {
        view.addSubview(movieNametextfield)
        movieNametextfield.delegate = self
        
        NSLayoutConstraint.activate([
            movieNametextfield.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            movieNametextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            movieNametextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50), // Ensure negative value
            movieNametextfield.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }

    
    func configureCallToActionButton(){
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:  -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}


extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Did tap return")
        return true
    }
}
