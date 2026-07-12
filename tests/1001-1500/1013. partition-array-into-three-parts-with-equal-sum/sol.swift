class Solution {
    func canThreePartsEqualSum(_ arr: [Int]) -> Bool {
        let total = arr.reduce(0, +)
        if total % 3 != 0 {
            return false
        }
        let target = total / 3
        var currentSum = 0
        var partitions = 0
        for i in 0..<arr.count {
            currentSum += arr[i]
            if currentSum == target {
                partitions += 1
                currentSum = 0
                if partitions == 2 && i < arr.count - 1 {
                    return true
                }
            }
        }
        return false
    }
}
