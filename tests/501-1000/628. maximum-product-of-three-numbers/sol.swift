class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        let n = sorted.count
        let a = sorted[n-1] * sorted[n-2] * sorted[n-3]
        let b = sorted[n-1] * sorted[0] * sorted[1]
        return max(a, b)
    }
}
