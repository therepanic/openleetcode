class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        var used = Array(repeating: false, count: sortedNums.count)
        var cur = [Int]()
        var res = [[Int]]()

        func backtrack() {
            if cur.count == sortedNums.count {
                res.append(cur)
                return
            }

            for i in 0..<sortedNums.count {
                if used[i] {
                    continue
                }
                if i > 0 && sortedNums[i] == sortedNums[i - 1] && !used[i - 1] {
                    continue
                }
                used[i] = true
                cur.append(sortedNums[i])
                backtrack()
                cur.removeLast()
                used[i] = false
            }
        }

        backtrack()
        return res
    }
}
