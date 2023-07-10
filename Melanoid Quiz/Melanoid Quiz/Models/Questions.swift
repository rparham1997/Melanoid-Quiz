//
//  Questions.swift
//  Melanoid Quiz
//
//  Created by Ramar Parham on 7/6/23.
//

import Foundation
import Supabase

struct Question: Identifiable, Decodable {
    var id = Int
    let createdAt: String
    let title: String
    let answer: String
    let choices: [String]
    var selection: String?
}
