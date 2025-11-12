//
//  DaySelectorButton.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 13/11/2025.
//

import SwiftUI

struct DaySelectorButton: View {
    @Binding var selectedDate: Date
    let date: Date
    let offset: Int
    let proxy: ScrollViewProxy

    private let calendar = Calendar.current

    private var today: Date {
        calendar.startOfDay(for: Date())
    }

    private var minDate: Date {
        calendar.date(byAdding: .day, value: -7, to: today) ?? today
    }

    private var maxDate: Date {
        calendar.date(byAdding: .day, value: 7, to: today) ?? today
    }

    private var isSelected: Bool {
        calendar.isDate(selectedDate, inSameDayAs: date)
    }

    private var isDisabled: Bool {
        date < minDate || date > maxDate
    }

    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                selectedDate = date
                proxy.scrollTo(offset, anchor: .center)
            }
        } label: {
            VStack(spacing: 4) {
                Text(accessibilityLabel(for: date))
                    .font(.caption)
                Text(dayNumber(for: date))
                    .font(.footnote).bold()
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .frame(width: 60)
            .background(isSelected ? Color.accentColor.opacity(0.15) : Color.secondary.opacity(0.12))
            .foregroundStyle(isSelected ? .accent : .primary)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
        .id(offset)
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.4 : 1.0)
        .accessibilityLabel(accessibilityLabel(for: date))
    }

    // MARK: - Helpers for chip labels
    private func dayNumber(for date: Date) -> String {
        let df = DateFormatter()
        df.locale = .current
        df.dateFormat = "d\nMMM"
        return df.string(from: date)
    }

    private func accessibilityLabel(for date: Date) -> String {
        if calendar.isDateInToday(date) { return "Today" }
        let df = DateFormatter()
        df.locale = .current
        df.dateFormat = "E"
        return df.string(from: date)
    }
}
