class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sortedCandidates = candidates.sorted()
        var res = [[Int]]()
        var cur = [Int]()

        func backtrack(_ start: Int, _ total: Int) {
            if total == target {
                res.append(cur)
                return
            }

            for i in start..<sortedCandidates.count {
                if total + sortedCandidates[i] > target {
                    break
                }
                cur.append(sortedCandidates[i])
                backtrack(i, total + sortedCandidates[i])
                cur.removeLast()
            }
        }

        backtrack(0, 0)
        return res
    }
}
