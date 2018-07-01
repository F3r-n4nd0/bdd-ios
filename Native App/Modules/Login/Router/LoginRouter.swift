//
//  LoginRouter.swift
//  Native App
//
//  Created by Fernando Luna on 6/30/18.
//  Copyright © 2018 f3rn4nd0. All rights reserved.
//

class LoginRouter {
    
    weak var viewController: LoginViewController?
    
    static func assembleModule() -> LoginViewController {
        let view = LoginViewController.instance()
        
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let router = LoginRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        router.viewController = view
        interactor.presenter = presenter

        return view
    }
    
}
