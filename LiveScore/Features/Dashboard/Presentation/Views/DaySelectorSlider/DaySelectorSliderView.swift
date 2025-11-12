//
//  DaySelectorSliderView.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 13/11/2025.
//

import SwiftUI

struct DaySelectorSliderView: View {
    @State private var selectedDate: Date = Calendar.current.startOfDay(for: Date())
    private let calendar = Calendar.current
    
    private var today: Date {
        calendar.startOfDay(for: Date())
    }
    
    private func offsetDate(from date: Date, by days: Int) -> Date {
        calendar.startOfDay(for: calendar.date(byAdding: .day, value: days, to: date) ?? date)
    }
    
    private func isSameDay(_ lhs: Date, _ rhs: Date) -> Bool {
        calendar.isDate(lhs, inSameDayAs: rhs)
    }
    
    var body: some View {
        HStack() {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(AppConstants.DateSelector.offsetRange, id: \.self) { offset in
                            let date = offsetDate(from: today, by: offset)
                            
                            DaySelectorButton(
                                selectedDate: $selectedDate,
                                date: date,
                                offset: offset,
                                proxy: proxy
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                .onAppear {
                    DispatchQueue.main.async {
                        withAnimation(.easeInOut) {
                            proxy.scrollTo(0, anchor: .center)
                        }
                    }
                }
            }
        }
        .padding(.top, 8)
    }
}




#Preview {
    DaySelectorSliderView()
}

