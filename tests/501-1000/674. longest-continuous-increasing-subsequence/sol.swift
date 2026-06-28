class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        var ptr1 = 0
        var ptr2 = 1
        let n = nums.count
        if n == 0 { return 0 }
        var maxLenSubseq = 1
        while ptr2 < n {
            while ptr2 < n && nums[ptr2] > nums[ptr2 - 1] {
                ptr2 += 1
            }
            maxLenSubseq = max(maxLenSubseq, ptr2 - ptr1)
            ptr1 = ptr2
            ptr2 += 1
        }
        return maxLenSubseq
    }
}
