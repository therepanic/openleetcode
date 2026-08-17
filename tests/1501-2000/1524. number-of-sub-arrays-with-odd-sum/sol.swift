class Solution {
    func numOfSubarrays(_ arr: [Int]) -> Int {
        var oddCount = 0
        var prefixSum = 0
        let mod = 1_000_000_007
        for a in arr {
            prefixSum += a
            oddCount += prefixSum % 2
        }
        oddCount += (arr.count - oddCount) * oddCount
        return oddCount % mod
    }
}
