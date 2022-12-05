//
//  FeatureTwoViewController.swift
//  
//
//  Created by Thomas Asheim Smedmann on 20/11/2022.
//

import UIKit

final class FeatureTwoViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()

    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Feature three", for: .normal)
        return button
    }()

    private weak var coordinator: FeatureTwoCoordinator?

    init(coordinator: FeatureTwoCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let view = UIView()

        view.addSubview(label)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 64),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.backgroundColor = .white

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "This is feature two!"

        button.addTarget(self, action: #selector(nextFeature), for: .primaryActionTriggered)
    }

    @objc private func nextFeature() {
        coordinator?.nextFeature()
    }
}
