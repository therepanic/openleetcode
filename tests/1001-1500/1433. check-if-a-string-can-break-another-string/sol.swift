class Solution {
    func checkIfCanBreak(_ s1: String, _ s2: String) -> Bool {
        var freq = Array(repeating: 0, count: 26)
        let n = s1.count

        for ch in s1 {
            freq[Int(ch.asciiValue! - Character("a").asciiValue!)] += 1
        }

        var temp1 = ""

        for i in stride(from: 25, through: 0, by: -1) {
            while freq[i] > 0 {
                temp1.append(Character(UnicodeScalar(Character("a").asciiValue! + UInt8(i))))
                freq[i] -= 1
            }
        }

        freq = Array(repeating: 0, count: 26)

        for ch in s2 {
            freq[Int(ch.asciiValue! - Character("a").asciiValue!)] += 1
        }

        var temp2 = ""

        for i in stride(from: 25, through: 0, by: -1) {
            while freq[i] > 0 {
                temp2.append(Character(UnicodeScalar(Character("a").asciiValue! + UInt8(i))))
                freq[i] -= 1
            }
        }

        let sorted1 = Array(temp1)
        let sorted2 = Array(temp2)

        var all1 = true
        var all2 = true

        for i in 0..<n {
            if sorted1[i] < sorted2[i] {
                all1 = false
            }
            if sorted2[i] < sorted1[i] {
                all2 = false
            }
        }

        return all1 || all2
    }
}
