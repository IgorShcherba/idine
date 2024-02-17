//
//  RestrictionBadge.swift
//  idine
//
//  Created by Igor Shcherba on 17/02/2024.
//

import SwiftUI

struct RestrictionBadge: View {
    var restriction: String
    var bgColor: Color
    var body: some View {
        Text(restriction)
            .padding(5)
            .font(.caption)
            .fontWeight(.black)
            .background(bgColor)
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}
