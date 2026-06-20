class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        var bulls = 0
        var secretCounts = [Int](repeating: 0, count: 10)
        var guessCounts = [Int](repeating: 0, count: 10)

        let secretChars = Array(secret)
        let guessChars = Array(guess)

        for i in 0..<secretChars.count {
            let s = secretChars[i]
            let g = guessChars[i]
            if s == g {
                bulls += 1
            } else {
                secretCounts[Int(String(s))!] += 1
                guessCounts[Int(String(g))!] += 1
            }
        }

        var cows = 0
        for i in 0..<10 {
            cows += min(secretCounts[i], guessCounts[i])
        }
        return "\(bulls)A\(cows)B"
    }
}
