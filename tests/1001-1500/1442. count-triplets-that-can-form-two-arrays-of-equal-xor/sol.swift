class Solution {
    func countTriplets(_ arr: [Int]) -> Int {
        var totalCount = 0
        var prefixXor = 0
        var prefixCount = [0: 1]
        var indexSum = [0: 0]
        for k in 1...arr.count {
            prefixXor ^= arr[k - 1]
            if let cnt = prefixCount[prefixXor], let sum = indexSum[prefixXor] {
                totalCount += cnt * (k - 1) - sum
            } else {
                prefixCount[prefixXor] = 0
                indexSum[prefixXor] = 0
            }
            prefixCount[prefixXor]! += 1
            indexSum[prefixXor]! += k
        }
        return totalCount
    }
}
