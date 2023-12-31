//
//  ContentView.swift
//  guestheflag
//
//  Created by Luis Rivera on 15/11/23.
//

import SwiftUI

struct FlagImage: View {
    let imageNumber : Int
    let countries : [String]
    var body: some View {
        Image(countries[imageNumber])
    }
}

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var showingScore: Bool = false
    @State private var showingFinalScore: Bool = false
    @State private var scoreTitle: String = ""
    @State private var score : Int = 0
    @State private var versus: Int = 0
    @State private var buttonText: String = "Next"
    @State private var countries : [String] = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland", "Spain", "UK", "Ukraine", "US"].shuffled()

    @State private var correctAnswer: Int = Int.random(in: 0...2)
    
    //MARK: - properties ANIMATION
    @State private var showAnimation: Bool = false
    @State private var animation = 0.0
    @State private var wrongAnswer = false
    @State private var onlyWrong = false
    @State private var scale = 1.0
    
    //MARK: - body
    var body: some View {
        ZStack {
//            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ],center: .top, startRadius: 200 , endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15){
                    VStack {
      
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    .padding()
                    
                    ForEach(0..<3){ number in
                        
                        Button{
                            //MARK: - button
                            withAnimation{
                            animation += 360
                             
                                flagtapped(number)
                            }
                            
                        }label: {
                            FlagImage(imageNumber: number, countries: countries)
                             
                        }
                            .alert(scoreTitle,isPresented: $showingScore){
                                Button(buttonText){
                                    if versus == 8 {
                                        reStart()
                                    } else {
                                        askQuestion()
                                    }
                                }
                            }message: {
                                Text("\(score) of \(versus)")
                            }//alert
                            .rotation3DEffect(.degrees(correctAnswer == number  && scoreTitle == "Correct" ? 360: 0),
                                              axis: (x:1.0, y:0.0, z: 0.0)
                            )
                            .opacity(self.wrongAnswer && number != self.correctAnswer ? 0.21 : 1)
                            .rotation3DEffect(.degrees(self.wrongAnswer && number != self.correctAnswer ?  360 : 0),
                                              axis: (x:0.0, y:1.0, z: 0.0)
                            )
                            .scaleEffect(self.wrongAnswer && number != self.correctAnswer ? 0.8 : 1)
                           
                        
                        
                            
                        
                    }//foreach
                }//vstack
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
                Spacer()
            }
            .padding()
        
            

        }//zstack
    }
    
    
    func flagtapped(_ number: Int){
        if(number == correctAnswer){
            scoreTitle = "Correct"
            score += 1
        }else{
            onlyWrong = true
            scoreTitle = "Incorrect"
        }
        versus+=1
        showingScore.toggle()
        wrongAnswer = true
        if versus == 8 {
            scoreTitle = "Final score"
            buttonText = "Let's try again"
          
        }
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        wrongAnswer = false
        scoreTitle = ""
        onlyWrong = false
    }
    
    func reStart(){
        score = 0
        versus = 0
        buttonText = "Next"
        askQuestion()
    }
}

#Preview {
    ContentView()
}
