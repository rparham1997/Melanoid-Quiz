//
//  QuestionView.swift
//  Melanoid Quiz
//
//  Created by Ramar Parham on 7/6/23.
//

import SwiftUI

struct QuestionView: View {
    @Binding var question: Question
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(question.title)
            
            
            ForEach(question.choices, id:\.self) { choice in
                HStack {
                    Button {
                        question.selection = choice
                    } label: {
                        if question.selection == choice {
                            Circle()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("AppColor"))
                        } else {
                            Circle()
                                .stroke()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                        }
                    }
                        
                        Text(choice)
                    }
                }
            }
            .foregroundColor(Color(uiColor: .secondaryLabel))
            .padding(.horizontal, 20)
            .frame(width: 340, height: 550, alignment: .leading)
            .background(Color(uiColor: .systemRed))
            .cornerRadius(20)
            .shadow(color: Color(uiColor: .label).opacity(0.2), radius: 50)
        }
    }
    
    struct QuestionView_Previews: PreviewProvider {
        static var previews: some View {
            QuestionView(question: .constant(Question(id: 1, createdAt: "", title: "Who was the first black person to receive a PHD?", answer: "A", choices: ["A","B","C", "D"])))
        }
    }

