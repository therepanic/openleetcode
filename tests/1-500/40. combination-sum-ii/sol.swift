class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sortedCandidates = candidates.sorted()
        var res = [[Int]]()
        var cur = [Int]()

        func backtrack(_ start: Int, _ total: Int) {
            if total == target {
                res.append(cur)
                return
            }

            var prev: Int? = nil
            for i in start..<sortedCandidates.count {
                if let prevValue = prev, sortedCandidates[i] == prevValue {
                    continue
                }
                if total + sortedCandidates[i] > target {
                    break
                }
                cur.append(sortedCandidates[i])
                backtrack(i + 1, total + sortedCandidates[i])
                cur.removeLast()
                prev = sortedCandidates[i]
            }
        }

        backtrack(0, 0)
        return res
    }
}
