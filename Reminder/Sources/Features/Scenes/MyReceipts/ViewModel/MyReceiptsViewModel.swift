//
//  MyReceiptsViewModel.swift
//  Reminder
//
//  Created by Arthur Rios on 15/01/25.
//

import Foundation

class MyReceiptsViewModel {
    func fetchData() -> [Medicine] {
        return DBHelper.shared.fetchReceipts()
    }
}
