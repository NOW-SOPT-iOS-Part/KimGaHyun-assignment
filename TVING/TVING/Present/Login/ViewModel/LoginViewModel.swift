//
//  LoginViewModel.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/08.
//

import UIKit

import Moya
import RxSwift
import RxCocoa

protocol LoginViewModelInputs {
    var idTextFieldText: BehaviorRelay<String?> { get }
    var passwordTextFieldText: BehaviorRelay<String?> { get }
}

protocol LoginViewModelOutputs {
    var isLoginButtonEnabled: Observable<Bool> { get }
    var loginButtonBackgroundColor: Observable<UIColor> { get }
    var loginButtonBorderColor: Observable<UIColor> { get }
}

protocol LoginViewModelType {
    var inputs: LoginViewModelInputs { get }
    var outputs: LoginViewModelOutputs { get }
}

final class LoginViewModel: LoginViewModelType, LoginViewModelInputs, LoginViewModelOutputs {
    
    // Inputs
    var idTextFieldText = BehaviorRelay<String?>(value: "")
    var passwordTextFieldText = BehaviorRelay<String?>(value: "")

    // Outputs
    var isLoginButtonEnabled: Observable<Bool>
    var loginButtonBackgroundColor: Observable<UIColor>
    var loginButtonBorderColor: Observable<UIColor>

    private let disposeBag = DisposeBag()

    init() {
        let isValidText = Observable.combineLatest(idTextFieldText.asObservable(), passwordTextFieldText.asObservable())
            .map { id, password in
                return !(id?.isEmpty ?? true) && !(password?.isEmpty ?? true)
            }

        isLoginButtonEnabled = isValidText

        loginButtonBackgroundColor = isValidText
            .map { $0 ? .tvingRed : .tvingBlack }

        loginButtonBorderColor = isValidText
            .map { $0 ? UIColor.clear : .tvingGray4 }
    }
    
    var inputs: LoginViewModelInputs { return self }
    var outputs: LoginViewModelOutputs { return self }
}
