//
//  gradient2.swift
//  guestheflag
//
//  Created by Luis Rivera on 17/11/23.
//

import SwiftUI

struct gradient2: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.blue.gradient)
    }
}

#Preview {
    gradient2()
}
