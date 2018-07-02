//
//  LoginTest.swift
//  Native AppUITests
//
//  Created by Fernando Luna on 7/1/18.
//  Copyright © 2018 f3rn4nd0. All rights reserved.
//

import Quick
import Nimble
import XCTest

class loginTest: QuickSpec {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launch()
    }
    
    override func spec() {
        
        describe("Feature: Login into the app") {
            
            describe("As User, I want to login in the app, So I can access the app") {

                context("Scenario: Login with a valid email and password") {
                    beforeEach {
                        let textFieldEmail = self.app.textFields["textFieldEmail"]
                        textFieldEmail.tap()
                        textFieldEmail.typeText("test@test.com")
                        
                        let textFieldPassword =  self.app.secureTextFields["textFieldPassword"]
                        textFieldPassword.tap()
                        textFieldPassword.typeText("123456")
                    }
                    it("Show Login alert") {
                        let alert = self.app.alerts.firstMatch
                        let exists = NSPredicate(format: "exists == true")
                        self.expectation(for: exists, evaluatedWith: alert, handler: nil)
                        self.app.buttons["buttonLogin"].tap()
                        self.waitForExpectations(timeout: 5, handler: nil)
                        expect(alert.label).to(equal("Login"))
                    }
                    
                }
                
                context("Scenario: Login with a invalid email and password") {                    
                    beforeEach {
                        let textFieldEmail = self.app.textFields["textFieldEmail"]
                        textFieldEmail.tap()
                        textFieldEmail.typeText("user@test.com")
                        
                        let textFieldPassword =  self.app.secureTextFields["textFieldPassword"]
                        textFieldPassword.tap()
                        textFieldPassword.typeText("00000000")
                    }
                    it("Show Login alert") {
                        let alert = self.app.alerts.firstMatch
                        let exists = NSPredicate(format: "exists == true")
                        self.expectation(for: exists, evaluatedWith: alert, handler: nil)
                        self.app.buttons["buttonLogin"].tap()
                        self.waitForExpectations(timeout: 5, handler: nil)
                        expect(alert.label).to(equal("Error"))
                    }
                }

            }
        }
    }
    
}
