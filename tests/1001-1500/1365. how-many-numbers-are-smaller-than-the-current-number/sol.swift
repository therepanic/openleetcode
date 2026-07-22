class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var allNums = [Int](repeating: 0, count: 101)
        var res = [Int](repeating: 0, count: nums.count)

        for v in nums {
            allNums[v] += 1
        }

        for v in 1...100 {
            allNums[v] += allNums[v - 1]
        }

        for (i, v) in nums.enumerated() {
            if v == 0 {
                res[i] = 0
            } else {
                res[i] = allNums[v - 1]
            }
        }
        return res
    }
}
