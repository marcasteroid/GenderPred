//
//  ContentView.swift
//  GenderPred
//
//  Created by Marco Margarucci on 27/09/23.
//

import SwiftUI

enum Gender: String {
    case male
    case female
}

struct ContentView: View {
    @State private var name: String = ""
    @State private var predictedGender: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Gender Predictor")
                    .font(.title)
                Image(systemName: "brain.head.profile")
                    .imageScale(.large)
                    .foregroundStyle(.black)
                Spacer()
            }
            .fontWeight(.bold)
            .fontWidth(.standard)
            TextField("Enter a name", text: $name)
                .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                .textFieldStyle(.roundedBorder)
            Text("Predicted gender")
                .font(.headline)
            Text(predictedGender)
                .foregroundStyle(.red)
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
