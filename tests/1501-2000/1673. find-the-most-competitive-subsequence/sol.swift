class Solution {
    func mostCompetitive(_ nums: [Int], _ k: Int) -> [Int] {
        var stack: [Int] = []
        let n = nums.count
        for i in 0..<n {
            while !stack.isEmpty && stack.last! > nums[i] {
                if n - 1 - i >= k - stack.count {
                    stack.removeLast()
                } else {
                    break
                }
            }
            stack.append(nums[i])
        }
        return Array(stack.prefix(k))
    }
}
