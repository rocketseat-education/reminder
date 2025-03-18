//
//  NewReceiptViewModel.swift
//  Reminder
//
//  Created by Arthur Rios on 13/01/25.
//

import Foundation
import UserNotifications

class NewReceiptViewModel {
    func addReceipt(remedy: String, time: String, recurrence: String, takeNow: Bool) {
        var finalTime = time
        if takeNow {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            finalTime = formatter.string(from: date)
        }
        DBHelper.shared.insertReceipt(remedy: remedy, time: finalTime, recurrence: recurrence, takeNow: takeNow)
        scheduleNotifications(remedy: remedy, time: finalTime, recurrence: recurrence)
    }

    private func scheduleNotifications(remedy: String, time: String, recurrence: String) {
        let center = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = "Hora de tomar o remédio!"
        content.body = "Lembre-se de tomar o \(remedy)"
        content.sound = .default

        guard let interval = getIntervalInHours(from: recurrence) else { return }

        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        guard let initialDate = formatter.date(from: time) else { return }

        let calendar = Calendar.current
        var currentDate = initialDate

        for index in 00..<(24 / interval) {
            let components = calendar.dateComponents([.hour, .minute], from: currentDate)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)

            let request = UNNotificationRequest(identifier: "\(remedy)-\(index)", content: content, trigger: trigger)

            center.add(request) { error in
                if let error = error {
                    print("Erro ao agendar notificações \(error)")
                } else {
                    print("Notificação para \(remedy) criada com sucesso!")
                }
            }
            currentDate = calendar.date(byAdding: .hour, value: interval, to: currentDate) ?? Date()
        }
    }

    private func getIntervalInHours(from recurrence: String) -> Int? {
        switch recurrence {
        case "De hora em hora":
            return 1
        case "2 em 2 horas":
            return 2
        case "4 em 4 horas":
            return 4
        case "6 em 6 horas":
            return 6
        case "8 em 8 horas":
            return 8
        case "12 em 12 horas":
            return 12
        case "Um por dia":
            return 24
        default:
            return nil
        }
    }
}
