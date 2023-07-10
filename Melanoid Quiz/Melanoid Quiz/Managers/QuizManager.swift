//
//  QuizManager.swift
//  Melanoid Quiz
//
//  Created by Ramar Parham on 7/6/23.
//

import Foundation
import Supabase

class QuizManager: ObservableObject {
    
   @Published var questions = [Question]()
    
//   @Published var mockQuestions = [
//
//        Question(title: "When was the first black person to recieve a PHD?", answer: "A", choices: ["A", "B", "C", "D"]),
//        Question(title: "When was the first black person to win an oscar?", answer: "A", choices: ["A", "B", "C", "D"]),
//        Question(title: "When was the first black person to play baseball??", answer: "A", choices: ["A", "B", "C", "D"]),
//        Question(title: "When was the first black person to win a noble peace prize?", answer: "A", choices: ["A", "B", "C", "D"])
//
//    ]
    
    let client = SupabaseClient(supabaseURL: URL(string:"https://mpwketwqdsrttirenyeo.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1wd2tldHdxZHNydHRpcmVueWVvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODg2OTI2NTgsImV4cCI6MjAwNDI2ODY1OH0.S3_E0OVDkJRMII2iP5JGnd2T-v_dR8-tJfNdgRpZyS8")
    
    init() {
        Task {
            do {
                let response = try await client.database.from("Quiz").select().select().execute()
                let data = response.underlyingResponse.data
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let questions = try decoder.decode([Question].self, from: data)
                await MainActor.run {
                    self.questions = questions
                }
            } catch {
                print("error fetching questions")
            }
        }
    }
    func canSubmitQuiz() -> Bool {
        return questions.filter({ $0.selection == nil}).isEmpty
    }
    func gradeQuiz() -> String {
        var correct: CGFloat = 0
        for question in questions {
            if question.answer == question.selection {
                correct += 1
            }
        }
        return QuizResult(correct: Int(correct), total: questions.count, grade: "\((correct/CGFloat(questions.count)) * 100) %")
    }
}

struct QuizResult {
    let correct: Int
    let total: Int
    let grade: String
}
