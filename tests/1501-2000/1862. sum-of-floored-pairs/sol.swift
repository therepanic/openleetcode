class Solution {
    func sumOfFlooredPairs(_ nums: [Int]) -> Int {
        let MOD = 1_000_000_007
        let maxi = 100_001
        let maxVal = nums.max() ?? 0
        let size = 2 * maxi + 1
        var freq = [Int](repeating: 0, count: size)
        for num in nums {
            freq[num] += 1
        }
        for i in 1..<size {
            freq[i] += freq[i - 1]
        }
        
        var total = 0
        for num in 1...maxVal {
            let countNum = freq[num] - freq[num - 1]
            if countNum == 0 { continue }
            var floorValue = 1
            while floorValue * num <= maxVal {
                let left = floorValue * num
                let right = min((floorValue + 1) * num - 1, maxVal)
                let countInRange = freq[right] - freq[left - 1]
                total = (total + countNum * floorValue * countInRange) % MOD
                floorValue += 1
            }
        }
        return total
    }
}
