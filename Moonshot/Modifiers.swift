//
//  Modifiers.swift
//  Moonshot
//
//  Created by Vitaliy Novichenko on 24.03.2025.
//

import Foundation
import SwiftUI

struct Rect: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 2)
            .foregroundStyle(.secondary)
            .padding(.vertical)
    }
}
    extension View {
        func myDevider() -> some View {
            modifier(Rect())
    }
}
