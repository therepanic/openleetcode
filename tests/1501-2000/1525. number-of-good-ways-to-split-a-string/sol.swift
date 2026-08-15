class Solution {
    func numSplits(_ s: String) -> Int {
        let chars = Array(s.utf8)
        var left = Array(repeating: 0, count: 26)
        var right = Array(repeating: 0, count: 26)
        for ch in chars { right[Int(ch - 97)] += 1 }
        var leftDistinct = 0
        var rightDistinct = right.filter { $0 > 0 }.count
        var answer = 0
        for index in 0..<(chars.count - 1) {
            let letter = Int(chars[index] - 97)
            if left[letter] == 0 { leftDistinct += 1 }
            left[letter] += 1
            right[letter] -= 1
            if right[letter] == 0 { rightDistinct -= 1 }
            if leftDistinct == rightDistinct { answer += 1 }
        }
        return answer
    }
}
