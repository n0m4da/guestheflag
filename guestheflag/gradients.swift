//
//  gradients.swift
//  guestheflag
//
//  Created by Luis Rivera on 17/11/23.
//

import SwiftUI

struct gradients: View {
    var body: some View {
        VStack {
            LinearGradient(colors: [.white, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        .frame(width: 200, height: 200)
        
        VStack{
            LinearGradient(stops: [
                .init(color: .blue, location: 0.45),
                .init(color: .black, location: 0.55)
            ], startPoint: .top, endPoint: .bottom)
        }
        .frame(width: 200, height: 200)
        .border(.red)
        
        VStack{
            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
        }
        .frame(width: 200, height: 200)
        
        VStack{
            AngularGradient(colors: [.red, .yellow, .green, .green, .red], center: .center)
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    gradients()
}
