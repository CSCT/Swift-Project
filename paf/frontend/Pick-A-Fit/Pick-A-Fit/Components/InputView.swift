//
//  InputView.swift
//  Pick-A-Fit
//
//  Created by Graceson Thompson on 2/4/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text : String
    let title: String
    let placeholder : String
    var isSecureField = false
    var body: some View {
        VStack(alignment: .leading,spacing: 12) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            if isSecureField{
                SecureField(placeholder,text: $text)
                    .font(.system(size: 16))
            }else {
                TextField(placeholder,text: $text)
                    .font(.system(size: 16))
            }
            Divider()
            
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
}
