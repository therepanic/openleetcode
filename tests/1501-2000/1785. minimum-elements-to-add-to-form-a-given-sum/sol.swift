class Solution {
    func minElements(_ nums: [Int], _ limit: Int, _ goal: Int) -> Int {
        let currentSum = nums.reduce(0, +)
        let diff = abs(goal - currentSum)
        return (diff + limit - 1) / limit
    }
}
