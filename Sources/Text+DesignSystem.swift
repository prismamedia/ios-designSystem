//
//  Text+DesignSystem.swift
//  DesignSystem
//
//  Created by Joey BARBIER on 22/11/2021.
//

import SwiftUI

public extension View {
    func designSystem(font style: DS.Font) -> some View {
        self
            .font(.custom(style.fontName, size: style.size))
            .multilineTextAlignment(style.alignment)
            .lineSpacing(style.size - style.lineHeight)
            .foregroundColor(style.color)
    }
    
    @ViewBuilder
    func designSystem(button style: DS.Button) -> some View {
        self
            .designSystem(font: style.fontStyle)
            .frame(width: style.width,
                   height: style.height,
                   alignment: style.alignment)
            .padding(.vertical, style.paddingVertical)
            .padding(.horizontal, style.paddingHorizontal)
            .background(style.backgroundColor)
            .cornerRadius(style.radius)
            .if(style.border != nil){ content in
                content.overlay(
                    RoundedRectangle(cornerRadius: style.border!.radius)
                        .stroke(style.border!.color,
                                lineWidth: style.border!.width)
                        .frame(width: style.width,
                               height: style.height,
                               alignment: style.alignment)
                )
            }
            .if(style.clipShape != nil) { content in
                content.clipShape(style.clipShape!)
            }
    }
}


struct DSButtonExemple_Previews: PreviewProvider {
    
    // Font
    static var greyCenter = DS.Font(fontName: "system",
                                    size: 14,
                                    lineHeight: 21,
                                    alignment: .center,
                                    color: .black)
    // Buttons
    static var fill = DS.Button(backgroundColor: .red,
                                radius: 34,
                                paddingVertical: 17,
                                fontStyle: greyCenter,
                                width: UIScreen.main.bounds.width - 30)
    
    static var border = DS.Button(paddingVertical: 17,
                                  fontStyle: greyCenter,
                                  border: DS.Button.Border(color: .black,
                                                           width: 1,
                                                           radius: 34),
                                  width: UIScreen.main.bounds.width - 30)
    
    static var fillBorder = DS.Button(backgroundColor: .red,
                                      radius: 34,
                                      paddingVertical: 17,
                                      fontStyle: greyCenter,
                                      border: DS.Button.Border(color: .blue,
                                                               width: 3,
                                                               radius: 34),
                                      width: UIScreen.main.bounds.width - 30)
    
    static var previews: some View {
        Group {
            Text("Lorem ipsum")
                .designSystem(button: fill)
            
            Text("Lorem ipsum")
                .designSystem(button: border)
            
            Text("Lorem ipsum")
                .designSystem(button: fillBorder)
            
            HStack{
                Text("Lorem ipsum")
                Image(systemName: "square.and.arrow.up.fill")
            }.designSystem(button: border)
        }
    }
}
