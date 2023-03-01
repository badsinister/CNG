/**
 
 AuthenticationViewController
 
 Экран логина.
 Отображение формы ввода логина - пароля,
 проверка ввода содержимого, отправка запроса
 авторизации.
 
 */

import UIKit
import CNGKitUI

/// ```
///     +-------------------------------------------------+
///     |                                                 |
///     |                                                 |
///     |                     [Title]                     |
///     |                    [Message]                    |
///     |                                                 |
///     |  [Label]                                        |
///     |  +-------------------------------------------+  |
///     |  | [X] TextField                             |  |
///     |  +-------------------------------------------+  |
///     |                                                 |
///     |  [Label]                                        |
///     |  +-------------------------------------------+  |
///     |  | [X] TextField                             |  |
///     |  +-------------------------------------------+  |
///     |                                                 |
///     |                +---------------+                |
///     |                |    [title]    |                |
///     |                +---------------+                |
///     |                                                 |
///     +-------------------------------------------------+
/// ```
class AuthenticationViewController: UIViewController {
    
    /// Фоновое изображение экрана
    fileprivate var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "World"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    /// Контейнер элементов
    fileprivate var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8.0
        return stackView
    }()
    
    /// Заголовок
    fileprivate var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28.0)
        label.textAlignment = .center
        label.text = "Добро пожаловать!"
        return label
    }()
    
    /// Текст
    fileprivate var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.text = "Для доступа в систему введите, пожалуйста, Ваши данные."
        return label
    }()
    
    /// Кнопка логина
    fileprivate var loginButton = CNGButton("Authorize")

    /// Логин. Название поля.
    fileprivate var loginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "Логин:"
        return label
    }()

    /// Логин. Поле ввода.
    fileprivate var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Емайл"
        textField.leftView = makeSFImage("person")
        textField.leftViewMode = .always
        textField.tintColor = .label
        textField.autocapitalizationType = .none
        return textField
    }()


    /// Пароль. Название поля.
    fileprivate var passwordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "Пароль:"
        return label
    }()
    
    /// Пароль. Поле ввода.
    fileprivate var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.leftView = makeSFImage("lock")
        textField.leftViewMode = .always
        textField.tintColor = .label
        textField.textAlignment = .left
        textField.autocapitalizationType = .none
        return textField
    }()

    /// Создание иконок для полей ввода
    private static func makeSFImage(_ name: String) -> UIImageView {
        let image = UIImage(systemName: name)
        let imageView = UIImageView(image: image)
        return imageView
    }

    lazy var context = AuthenticationDataContext()
    
    // MARK: - Initializator

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIControl.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIControl.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Создание представления
    
    private func setup() {
        addSubviews()
        constrainSubviews()
        addGestures()
        styleDidChange()
    }
    
    private func addSubviews() {
        [backgroundImageView, containerStackView].forEach { view.addSubview($0) }
        [titleLabel, textLabel, loginLabel, loginTextField, passwordLabel, passwordTextField, loginButton].forEach { containerStackView.addArrangedSubview($0) }
    }
    
    private func constrainSubviews() {
        [backgroundImageView, containerStackView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            containerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerStackView.widthAnchor.constraint(equalToConstant: view.bounds.width > 440 ? 400.0 : 300.0),

            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func addGestures() {
        // Скрытие клавиатуры при нажатии в пустое место или свайпе вниз
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(resignResponder))
        tapGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(resignResponder))
        swipeGestureRecognizer.direction = .down
        view.addGestureRecognizer(swipeGestureRecognizer)

        // События нажатия кнопок
        [loginButton].forEach { $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside) }
    }
    
    private func styleDidChange() {
        view.backgroundColor = .systemGroupedBackground
        containerStackView.setCustomSpacing(58, after: textLabel)
        containerStackView.setCustomSpacing(32, after: loginTextField)
        containerStackView.setCustomSpacing(56, after: passwordTextField)
    }
    
    // MARK: - Actions
    
    @objc
    func resignResponder() {
        view.endEditing(true)
    }

    //MARK: - Открытие / скрытие клавиатуры
    
    @objc
    private func keyboardWillShow(_ notification: Notification) {
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let bottomOffset = view.bounds.size.height - containerStackView.frame.origin.y - containerStackView.bounds.height
        if bottomOffset < value.cgRectValue.height {
            let diff = (value.cgRectValue.height) - bottomOffset
            containerStackView.transform = CGAffineTransform(translationX: 0, y: -diff)
        }
    }
    
    @objc
    private func keyboardWillHide(_ notification: Notification) {
        containerStackView.transform = .identity
    }

    // MARK: - Button Actions

    @objc
    private func didTapButton(_ sender: UIButton) {
        switch sender {
        case loginButton:
            context.login(login: loginTextField.text, password: passwordTextField.text) { [weak self] (success, message) in
                guard success else {
                    // Авторизация не удалась. Сообщение об ошибке: message
                    let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: .cancel))
                    self?.present(alertController, animated: true)
                    return
                }
                // -------------------------------------------------- //
                // Успешно аторизовались. Добро пожаловать в систему! //
                // -------------------------------------------------- //

                self?.dismiss(animated: true, completion: nil)
                
            }
        default: fatalError("Target not set up properly")
        }
    }

}
