//
//  QuestionView.swift
//  TestSubDeVinci
//
//  Created by COURS1 on 19/04/2024.
//

import SwiftUI

struct QuestionView: View {
    

    @State var questions = Model().questions
    @State var index = 0
    @State var score = 0
    
    var body: some View {
        Text(questions[index].statement)
        Button("\(questions[index].proposal[0])") {
            if questions[index].answer == possibleAnswers.one {
                score += 1
            }
            if index < questions.count {
                index += 1
            }
            if index == 10 {
                
            }
        }
        Button("\(questions[index].proposal[1])") {
            if questions[index].answer == possibleAnswers.two {
                score += 1
            }
            if index < questions.count {
                index += 1
            }
        }
        Button("\(questions[index].proposal[2])") {
            if questions[index].answer == possibleAnswers.three {
                score += 1
            }
            if index < questions.count {
                index += 1
            }
            
        }
    }
}


#Preview {
    QuestionView()
}
