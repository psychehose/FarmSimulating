//
//  ViewController.swift
//  FarmSimulate
//
//  Created by 김호세 on 6/13/23.
//

import UIKit

final class ViewController: UIViewController {

  private lazy var feedButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .white
    button.setTitle("Feed your Animals", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)

    button.addTarget(self, action: #selector(didTapFeedButton), for: .touchUpInside)
    return button
  }()
  private var farm = Farm()


  override func viewDidLoad() {
    super.viewDidLoad()

    setupViews()

  }

  func setupViews() {

    feedButton.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(feedButton)

    NSLayoutConstraint.activate([
      feedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      feedButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }

}



// MARK: Func

fileprivate extension ViewController {
  @objc
  func didTapFeedButton() {
    farm.feed(Cow())
    farm.feed(Horse())
    farm.feed(Chicken())
  }
}
