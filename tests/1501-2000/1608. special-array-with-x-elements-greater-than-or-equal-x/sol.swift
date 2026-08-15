class Solution {
    func specialArray(_ nums: [Int]) -> Int {
        var ans = [Int](repeating: 0, count: nums.count + 1)
        for i in 0...nums.count {
            var count = 0
            for ele in nums {
                if i <= ele { count += 1 }
            }
            ans[i] = count
            if ans[i] == i { return i }
        }
        return -1
    }
}
