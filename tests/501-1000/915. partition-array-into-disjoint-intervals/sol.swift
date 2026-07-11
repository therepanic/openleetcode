class Solution {
    func partitionDisjoint(_ nums: [Int]) -> Int {
        let n = nums.count
        var prefixMax = [Int](repeating: 0, count: n)
        prefixMax[0] = nums[0]
        for i in 1..<n {
            prefixMax[i] = max(prefixMax[i-1], nums[i])
        }
        
        var suffixMin = [Int](repeating: 0, count: n)
        suffixMin[n-1] = nums[n-1]
        for i in stride(from: n-2, through: 0, by: -1) {
            suffixMin[i] = min(suffixMin[i+1], nums[i])
        }
        
        for i in 0..<n-1 {
            if prefixMax[i] <= suffixMin[i+1] {
                return i + 1
            }
        }
        return -1
    }
}
