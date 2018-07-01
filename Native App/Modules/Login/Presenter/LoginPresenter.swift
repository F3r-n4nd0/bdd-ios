//
//  LoginPresenter.swift
//  Native App
//
//  Created by Fernando Luna on 6/30/18.
//  Copyright © 2018 f3rn4nd0. All rights reserved.
//

import RxSwift

class LoginPresenter {
    
    weak var view: LoginViewController?
    var router: LoginRouter!
    var interactor: LoginInteractor!
    
    private let disposeBag = DisposeBag()
    
    func login(email: String, password: String) {
        view?.startAnimating()
        interactor.login(email: email, password: password)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] credential in
                self?.view?.stopAnimating()
                self?.showInfoMessage(message: "Login Successful")
            }, onError: {[weak self] error in
                self?.view?.stopAnimating()
                self?.showErrorMessage(message: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
    private func showInfoMessage(message: String) {
        view?.showInfoMessage(message: message)
    }
    
    private func showErrorMessage(message: String) {
        view?.showErrorMessage(message: message)
    }
    
}
