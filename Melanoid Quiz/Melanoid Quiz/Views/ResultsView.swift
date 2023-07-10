//
//  ResultsView.swift
//  Melanoid Quiz
//
//  Created by Ramar Parham on 7/6/23.
//

import SwiftUI

struct ResultsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var result: QuizResult
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Quiz App")
                .font(.system(size: 64))
            Text("Your Quiz is completed!")
                .font(.system(size: 24))
            
            Text("Results")
                .font(.system(size: 50))
            
            VStack {
                Text("\(result.correct) out of \(result.total)")
                
                Text(result.grade)
            }
            
            Text("You completed the quiz!")
                .font(.system(size: 24))
            
            
            Button {
                dismiss()
            } label: {
                Text("Retake Quiz")
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color("AppColor"))
                            .frame(width: 340)
                        )
            }
            Spacer()
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(result: .init(correct: 8, total: 10, grade: "80%"))
    }
}
