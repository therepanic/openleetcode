class Solution {
    func wordSubsets(_ words1: [String], _ words2: [String]) -> [String] {
        var maxCharFreq = Array(repeating: 0, count: 26)
        var tempCharFreq = Array(repeating: 0, count: 26)

        for word in words2 {
            for ch in word {
                tempCharFreq[Int(ch.asciiValue! - Character("a").asciiValue!)] += 1
            }
            for i in 0..<26 {
                maxCharFreq[i] = max(maxCharFreq[i], tempCharFreq[i])
            }
            tempCharFreq = Array(repeating: 0, count: 26)
        }

        var universalWords: [String] = []

        for word in words1 {
            for ch in word {
                tempCharFreq[Int(ch.asciiValue! - Character("a").asciiValue!)] += 1
            }
            var isUniversal = true
            for i in 0..<26 {
                if maxCharFreq[i] > tempCharFreq[i] {
                    isUniversal = false
                    break
                }
            }
            if isUniversal {
                universalWords.append(word)
            }
            tempCharFreq = Array(repeating: 0, count: 26)
        }

        return universalWords
    }
}
