//
//  Cell.swift
//  HW13-Settings
//
//  Created by Onix qq on 26.06.22.
//

import UIKit

struct Cell {
    var imageName: String
    var containerBackgroundColor: UIColor
    var title: String
    var detailTextLabel: String?
    var buttonTitle: String?
    var isCustomCell = false
    
    static func getData() -> [[Cell]] {
        let firstSection = [Cell(imageName: "airplane",
                                 containerBackgroundColor: .systemOrange,
                                 title: "Авиарежим"),
                            Cell(imageName: "wifi",
                                 containerBackgroundColor: .systemBlue,
                                 title: "Wi-Fi",
                                 detailTextLabel: "Не подключено"),
                            Cell(imageName: "bluetooth",
                                 containerBackgroundColor: .systemBlue,
                                 title: "Bluetooth",
                                 detailTextLabel: "Вкл.",
                                 isCustomCell: true),
                            Cell(imageName: "antenna.radiowaves.left.and.right",
                                 containerBackgroundColor: .systemGreen,
                                 title: "Сотовая связь"),
                            Cell(imageName: "personalhotspot",
                                 containerBackgroundColor: .systemGreen,
                                 title: "Режим модема"),
                            Cell(imageName: "vpn",
                                 containerBackgroundColor: .systemBlue,
                                 title: "VPN",
                                 isCustomCell: true)]
        
        let secondSection = [Cell(imageName: "bell.badge.fill",
                                  containerBackgroundColor: .systemRed,
                                  title: "Уведомления"),
                             Cell(imageName: "speaker.wave.3.fill",
                                  containerBackgroundColor: .systemRed,
                                  title: "Звуки, тактильные сигналы"),
                             Cell(imageName: "moon.fill",
                                  containerBackgroundColor: .systemIndigo,
                                  title: "Не беспокоить"),
                             Cell(imageName: "hourglass",
                                  containerBackgroundColor: .systemIndigo,
                                  title: "Экранное время")]
        
        let thirdSection = [Cell(imageName: "gear",
                                 containerBackgroundColor: .systemGray,
                                 title: "Основные",
                                 buttonTitle: "1"),
                            Cell(imageName: "switch.2",
                                 containerBackgroundColor: .systemGray,
                                 title: "Пункт управления"),
                            Cell(imageName: "textformat.size",
                                 containerBackgroundColor: .systemIndigo,
                                 title: "Экран и яркость"),
                            Cell(imageName: "homescreen",
                                 containerBackgroundColor: .systemBlue,
                                 title: "Экран \u{00AB}Домой\u{00BB}",
                                 isCustomCell: true),
                            Cell(imageName: "accessibility",
                                 containerBackgroundColor: .systemBlue,
                                 title: "Универсальный доступ",
                                 isCustomCell: true)]
        
        return [firstSection, secondSection, thirdSection]
    }
}
