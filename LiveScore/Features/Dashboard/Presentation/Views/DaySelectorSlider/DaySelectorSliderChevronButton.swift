//
//  DaySelectorSliderChevronButton.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 13/11/2025.
//

import SwiftUI

struct DaySelectorSliderChevronButton: View {
    enum Direction {
        case left
        case right
        
        var systemImageName: String {
            switch self {
            case .left:  return "chevron.left"
            case .right: return "chevron.right"
            }
        }
    }
    
    let direction: Direction
    var isDisabled: Bool = false
    var onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            Image(systemName: direction.systemImageName)
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .frame(width: 30, height: 60)
                .background(Color.secondary.opacity(0.12))
                .foregroundStyle(.primary)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.4 : 1.0)
        .accessibilityLabel(direction == .left ? "Previous day" : "Next day")
    }
}

#Preview {
    HStack(spacing: 16) {
        DaySelectorSliderChevronButton(direction: .left) {}
        DaySelectorSliderChevronButton(direction: .right, isDisabled: true) {}
    }
    .padding()
}

