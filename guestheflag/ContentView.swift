//
//  ContentView.swift
//  guestheflag
//
//  Created by Luis Rivera on 15/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = ""
    @State private var score : Int = 0
    @State private var versus: Int = 0
    @State private var countries : [String] = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer: Int = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 30){
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                    
                }
                .padding()
                
                ForEach(0..<3){ number in
                    
                    Button{
                        //MARK: - button
                        flagtapped(number)
                    }label: {
                        Image(countries[number])
                         
                    }
                    .alert(scoreTitle,isPresented: $showingScore){
                        Button("Siguiente", action: askQuestion)
                    }message: {
                        Text("\(score) de \(versus)")
                    }//alert
                    
                }//foreach
            }//vstack

        }//zstack
        
   
    }
    func flagtapped(_ number: Int){
        if(number == correctAnswer){
            scoreTitle = "Correcto"
            score += 1
        }else{
            scoreTitle = "Inconrrecto"
        }
        versus+=1
        showingScore.toggle()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
