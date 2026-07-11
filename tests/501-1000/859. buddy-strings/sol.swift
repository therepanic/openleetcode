class Solution {
    func buddyStrings(_ s: String, _ goal: String) -> Bool {
        if s.count != goal.count { return false }
        if s == goal {
            return Set(s).count < s.count
        }
        let sArr = Array(s)
        let gArr = Array(goal)
        var diffs: [Int] = []
        for i in 0..<sArr.count {
            if sArr[i] != gArr[i] {
                diffs.append(i)
            }
        }
        return diffs.count == 2 && sArr[diffs[0]] == gArr[diffs[1]] && sArr[diffs[1]] == gArr[diffs[0]]
    }
}
