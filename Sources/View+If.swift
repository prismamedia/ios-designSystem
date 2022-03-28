//
//  Button+DesignSystem.swift
//  GEO
//
//  Created by Joey BARBIER on 18/11/2021.
//  Copyright © 2021 prismamedia. All rights reserved.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}
