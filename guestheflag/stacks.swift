//
//  stacks.swift
//  guestheflag
//
//  Created by Luis Rivera on 17/11/23.
//

import SwiftUI

struct stacks: View {
    var body: some View {
//        Spacer()
//        VStack() {
//            Image(systemName: "globe")
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            Text("this is another text view")
//        }
//         Spacer(minLength: 10)
//        HStack(
//            spacing: 20) {
//            Image(systemName: "globe")
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            Text("this is another text view")
//        }

        
        ZStack{
            VStack(spacing: 0){
                Color.red
                Color.blue
            }
            
         //   Color(red: 1, green: 0.8, blue: 0)
               // .frame(minWidth: 200, maxWidth: .infinity, maxHeight:200)
                Text("this is another text view")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
              
        }
        .ignoresSafeArea()

       
    }
}

#Preview {
    stacks()
}
