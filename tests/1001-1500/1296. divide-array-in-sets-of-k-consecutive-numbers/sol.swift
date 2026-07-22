class Solution {
    func isPossibleDivide(_ nums: [Int], _ k: Int) -> Bool {
        if nums.count % k != 0 { return false }
        var count = [Int: Int]()
        for num in nums {
            count[num, default: 0] += 1
        }
        let sortedNums = nums.sorted()
        for num in sortedNums {
            if count[num] == 0 { continue }
            for i in 0..<k {
                let cur = num + i
                if count[cur, default: 0] == 0 { return false }
                count[cur]! -= 1
            }
        }
        return true
    }
}
