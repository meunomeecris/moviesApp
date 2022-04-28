//
//  TextFieldValidationModifier.swift
//  movieApp
//
//  Created by Cris Messias on 19/04/22.
//

import SwiftUI

struct TextFieldValidationModifier: ViewModifier {
    @State var validationState: ValidationState
    
    func body(content: Content) -> some View {
            content
            .border(validationColor(state: validationState))
    }
}


extension TextFieldValidationModifier {
    func validationColor(state: ValidationState) -> Color {
        switch state {
        case .initial:
            return Color("DarkMode")
        case .invalid:
            return .red
        case .valid:
            return .green
        }
    }
}
