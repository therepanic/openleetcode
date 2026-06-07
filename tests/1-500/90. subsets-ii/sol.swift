class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var res: [[Int]] = []
        var cur: [Int] = []
        func dfs(_ start: Int) {
            res.append(cur)
            var i = start
            while i < nums.count {
                if i == start || nums[i] != nums[i - 1] {
                    cur.append(nums[i])
                    dfs(i + 1)
                    cur.removeLast()
                }
                i += 1
            }
        }
        dfs(0)
        return res
    }
}
