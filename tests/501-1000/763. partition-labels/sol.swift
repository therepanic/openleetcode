class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        let chars = Array(s)
        var last = Array(repeating: 0, count: 26)
        for i in 0..<chars.count {
            last[Int(chars[i].unicodeScalars.first!.value) - Int(Character("a").unicodeScalars.first!.value)] = i
        }
        var ans = [Int]()
        var start = 0
        var end = 0
        for i in 0..<chars.count {
            let idx = Int(chars[i].unicodeScalars.first!.value) - Int(Character("a").unicodeScalars.first!.value)
            end = max(end, last[idx])
            if i == end {
                ans.append(end - start + 1)
                start = i + 1
            }
        }
        return ans
    }
}
