class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var count = [Int: Int]()
        for num in nums {
            count[num, default: 0] += 1
        }
        let uniqueNums = count.keys.sorted()
        var prev: Int? = nil
        var take = 0, skip = 0

        for num in uniqueNums {
            let maxPoints = max(skip, take)
            if prev == num - 1 {
                take = num * count[num]! + skip
                skip = maxPoints
            } else {
                take = num * count[num]! + maxPoints
                skip = maxPoints
            }
            prev = num
        }

        return max(take, skip)
    }
}
