class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var totalSum = 0
        var seen = Set<Int>()
        for num in nums {
            totalSum += num
            seen.insert(num)
        }
        var uniqueSum = 0
        for num in seen {
            uniqueSum += num
        }
        let numerator = 3 * uniqueSum - totalSum
        return numerator >> 1
    }
}
