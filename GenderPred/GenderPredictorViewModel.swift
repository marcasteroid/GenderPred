//
//  GenderPredictorViewModel.swift
//  GenderPred
//
//  Created by Marco Margarucci on 27/09/23.
//

import Foundation

class GenderPredictorViewModel: ObservableObject {
    @Published private(set) var prediction: String = ""
    
    private func features(_ string: String) -> [String: Double] {
        guard !string.isEmpty else { return [:] }
        let string = string.lowercased()
        var keys = [String]()
        keys.append("firstLetter1=\(string.prefix(1))")
        keys.append("firstLetter2=\(string.prefix(2))")
        keys.append("firstLetter3=\(string.prefix(3))")
        keys.append("lastLetter1=\(string.prefix(1))")
        keys.append("lastLetter2=\(string.prefix(2))")
        keys.append("lastLetter3=\(string.prefix(3))")
        return keys.reduce([String: Double]()) { (result, key) -> [String: Double] in
            var result = result
            result[key] = 1.0
            return result
        }
    }
    
    func predictGenderFromName(_ name: String) {
        let nameFeature = features(name)
        let model = GenderByName()
        if let prediction = try? model.prediction(input: nameFeature) {
            if prediction.classLabel == "F" {
                self.prediction = Gender.female.rawValue
            } else {
                self.prediction = Gender.male.rawValue
            }
        }
    }
}
