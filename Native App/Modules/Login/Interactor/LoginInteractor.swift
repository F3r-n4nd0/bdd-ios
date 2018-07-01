//
//  LoginInteractor.swift
//  Native App
//
//  Created by Fernando Luna on 6/30/18.
//  Copyright © 2018 f3rn4nd0. All rights reserved.
//

import Auth0
import RxSwift

class LoginInteractor {
    
    weak var presenter: LoginPresenter!
    
    func login(email: String, password: String) -> Observable<Auth0.Credentials> {
        return PublishSubject.create { observer -> Disposable in
            Auth0
                .authentication(clientId: "6LWKiXhbMdvDXjnKcPARyfgQZtzbT5V5", domain: "f3r.auth0.com")
                .login(usernameOrEmail: email,
                       password: password,
                       realm: "Username-Password-Authentication",
                       audience: "https://f3r.auth0.com/api/v2/",
                       scope: "openid profile",
                       parameters: nil)
                .start { result in
                    switch result {
                    case .success(let credentials):
                        observer.onNext(credentials)
                        break
                    case .failure(let error):
                        observer.onError(error)
                        break
                    }
            }
            return Disposables.create()
        }
        
    }
    
}
