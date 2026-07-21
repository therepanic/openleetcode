class Solution {
    func minDifference(_ nums: [Int]) -> Int {
        if nums.count <= 3 {
            return 0
        }
        let sorted = nums.sorted()
        let n = sorted.count
        return min(
            sorted[n-4] - sorted[0],
            sorted[n-3] - sorted[1],
            sorted[n-2] - sorted[2],
            sorted[n-1] - sorted[3]
        )
    }
}
