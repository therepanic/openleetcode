class Solution {
    func tupleSameProduct(_ nums: [Int]) -> Int {
        var productCount: [Int: Int] = [:]
        var ans = 0

        for i in 0..<nums.count {
            for j in (i+1)..<nums.count {
                let product = nums[i] * nums[j]
                ans += 8 * (productCount[product] ?? 0)
                productCount[product, default: 0] += 1
            }
        }

        return ans
    }
}
