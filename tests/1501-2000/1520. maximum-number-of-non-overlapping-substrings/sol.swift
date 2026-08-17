class Solution {
    func maxNumOfSubstrings(_ s: String) -> [String] {
        let bytes = Array(s.utf8)
        let n = bytes.count
        var first = Array(repeating: n, count: 26)
        var last = Array(repeating: 0, count: 26)
        for index in 0..<n {
            let letter = Int(bytes[index] - 97)
            first[letter] = min(first[letter], index)
            last[letter] = index
        }
        var answer: [String] = []
        var previousEnd = -1
        for start in 0..<n {
            if first[Int(bytes[start] - 97)] != start { continue }
            var end = last[Int(bytes[start] - 97)]
            var index = start
            var valid = true
            while index <= end {
                let letter = Int(bytes[index] - 97)
                if first[letter] < start { valid = false; break }
                end = max(end, last[letter])
                index += 1
            }
            if !valid { continue }
            let value = String(bytes: bytes[start...end], encoding: .utf8)!
            if start > previousEnd { answer.append(value) } else { answer[answer.count - 1] = value }
            previousEnd = end
        }
        return answer
    }
}
