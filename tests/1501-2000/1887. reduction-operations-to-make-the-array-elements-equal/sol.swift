class Solution {
    func reductionOperations(_ nums: [Int]) -> Int {
        var freq = [Int](repeating: 0, count: 50001)
        for num in nums {
            freq[num] += 1
        }
        var idx = 1
        while freq[idx] == 0 {
            idx += 1
        }
        var val = 0, total = 0
        for i in stride(from: 50000, through: idx+1, by: -1) {
            if freq[i] > 0 {
                val += freq[i]
                total += val
            }
        }
        return total
    }
}
