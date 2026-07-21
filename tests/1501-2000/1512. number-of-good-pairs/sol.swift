class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var pairs = [Int: Int]()
        var count = 0
        for num in nums {
            if let val = pairs[num] {
                count += val
            }
            pairs[num, default: 0] += 1
        }
        return count
    }
}
