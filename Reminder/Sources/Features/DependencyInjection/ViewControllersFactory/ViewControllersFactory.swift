//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Arthur Rios on 18/10/24.
//

import Foundation

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    func makeRecipesViewController() -> NewReceiptViewController {
        let viewController = NewReceiptViewController()
        return viewController
    }
    
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
        let contentView = SplashView()
        let viewController = SplashViewController(contentView: contentView, flowDelegate: flowDelegate)
        return viewController
    }
    
    func makeLoginBottomSheetController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController {
        let contentView = LoginBottomSheetView()
        let viewController = LoginBottomSheetViewController(contentView: contentView, flowDelegate: flowDelegate)
        return viewController
    }
    
    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController {
        let contentView = HomeView()
        let viewController = HomeViewController(contentView: contentView, flowDelegate: flowDelegate)
        
        return viewController
    }
    
    func makeMyReceiptsViewController(flowDelegate: any MyReceiptsFlowDelegate) -> MyReceiptsViewController {
        let contentView = MyReceiptsView()
        let viewController = MyReceiptsViewController(contentView: contentView, flowDelegate: flowDelegate)
        return viewController
    }
    
    
}
