class Solution {
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        var nums = nums
        let total = nums.reduce(0, +)
        if total % k != 0 { return false }
        let target = total / k
        nums.sort(by: >)
        if nums[0] > target { return false }
        let n = nums.count
        var memo: [Int: Bool] = [:]
        
        func dfs(_ used: Int, _ curr: Int) -> Bool {
            if used == (1 << n) - 1 { return true }
            let key = (used << 10) | curr
            if let result = memo[key] { return result }
            for i in 0..<n {
                if ((used >> i) & 1) == 0 && curr + nums[i] <= target {
                    let newCurr = curr + nums[i]
                    let nxt = newCurr == target ? 0 : newCurr
                    if dfs(used | (1 << i), nxt) {
                        memo[key] = true
                        return true
                    }
                }
            }
            memo[key] = false
            return false
        }
        
        return dfs(0, 0)
    }
}
