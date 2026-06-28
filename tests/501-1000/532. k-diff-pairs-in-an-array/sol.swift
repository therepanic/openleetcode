class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        if k < 0 { return 0 }
        var count = 0
        var numCounts = [Int: Int]()
        for num in nums {
            numCounts[num, default: 0] += 1
        }
        for (num, freq) in numCounts {
            if k == 0 {
                if freq >= 2 { count += 1 }
            } else {
                if numCounts[num + k] != nil { count += 1 }
            }
        }
        return count
    }
}
