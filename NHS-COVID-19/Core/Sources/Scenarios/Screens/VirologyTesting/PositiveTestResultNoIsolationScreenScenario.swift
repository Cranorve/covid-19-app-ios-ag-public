//
// Copyright © 2020 NHSX. All rights reserved.
//

import Combine
import Domain
import Integration
import Interface
import UIKit

public class PositiveTestResultNoIsolationScreenScenario: Scenario {
    public static var kind = ScenarioKind.screen
    public static var name: String = "Virology Testing - Positive, no Isolation"
    
    public static let onlineServicesLinkTapped: String = "Online services link tapped"
    public static let continueTapped: String = "Continue button tapped"
    
    static var appController: AppController {
        NavigationAppController { (parent: UINavigationController) in
            let interactor = Interactor(viewController: parent)
            return PositiveTestResultNoIsolationViewController(interactor: interactor)
        }
    }
}

private class Interactor: PositiveTestResultNoIsolationViewController.Interacting {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func didTapOnlineServicesLink() {
        viewController?.showAlert(title: PositiveTestResultNoIsolationScreenScenario.onlineServicesLinkTapped)
    }
    
    func didTapContinue() {
        viewController?.showAlert(title: PositiveTestResultNoIsolationScreenScenario.continueTapped)
    }
}
