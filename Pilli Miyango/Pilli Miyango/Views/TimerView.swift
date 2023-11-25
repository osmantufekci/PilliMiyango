//
//  GaugeTimer.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 14.11.2023.
//

import SwiftUI

struct TimerView: View {
    @State var timeRemaining = 6 * 3600 + 46 * 60 + 42 // Örneğin, 6 saat 46 dakika 42 saniye

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var blockType: BlockTypes
    var body: some View {
        HStack {
            ForEach(0..<timeUnits.count, id: \.self) { index in
                if value(for:timeUnits[index]) != 0 {
                    Gauge(
                        value: Float(value(for: timeUnits[index])),
                        in: range(for: timeUnits[index]),
                        label: {
                            Text(timeStrings[index])

                        },
                        currentValueLabel: { Text("\(value(for:timeUnits[index]))")},
                        markedValueLabels: {
                            Text("0%").tag(0)
                            Text("50%").tag(0.5)
                            Text("100%").tag(1.0)
                        })
                    .tint(blockType.color)
                    .gaugeStyle(.accessoryCircular)
                }
            }
        }
        .onReceive(timer) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
        }
    }

    private var timeUnits: [Calendar.Component] {
        [.year, .day, .hour, .minute, .second]
    }
    
    private var timeStrings: [String] {
        ["Yıl","Gün", "Saat", "Dak", "San"]
    }

    private func value(for component: Calendar.Component) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .day, .hour, .minute, .second], from: Date(), to: calendar.date(byAdding: .second, value: timeRemaining, to: Date())!)
        switch component {
        case .year:
            return components.year ?? 0
        case .day:
            return components.day ?? 0
        case .hour:
            return components.hour ?? 0
        case .minute:
            return components.minute ?? 0
        case .second:
            return components.second ?? 0
        default:
            return 0
        }
    }
    
    private func range(for component: Calendar.Component) -> ClosedRange<Float> {
        switch component {
        case .year:
            return 0...999
        case .day:
            return 0...365
        case .hour:
            return 0...24
        case .minute:
            return 0...60
        case .second:
            return 0...60
        default: return 0...0
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timeRemaining: 15000000, blockType: .OnNumara)
    }
}
