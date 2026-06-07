class Solution {
    func jump(_ nums: [Int]) -> Int {
        let n = nums.count
        if n <= 1 {
            return 0
        }

        var jumps = 0
        var currEnd = 0
        var maxReach = 0

        for i in 0..<(n - 1) {
            maxReach = max(maxReach, i + nums[i])
            if i == currEnd {
                jumps += 1
                currEnd = maxReach
                if currEnd >= n - 1 {
                    break
                }
            }
        }

        return jumps
    }
}
