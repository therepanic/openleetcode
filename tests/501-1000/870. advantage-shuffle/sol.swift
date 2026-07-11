class Solution {
    func advantageCount(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let n = nums1.count
        let sorted1 = nums1.sorted()
        let paired = nums2.enumerated().sorted { $0.element < $1.element }
        var res = Array(repeating: 0, count: n)
        var left = 0, right = n - 1
        var idx = n - 1
        while idx >= 0 {
            let pos = paired[idx].offset
            let val = paired[idx].element
            if sorted1[right] > val {
                res[pos] = sorted1[right]
                right -= 1
            } else {
                res[pos] = sorted1[left]
                left += 1
            }
            idx -= 1
        }

        return res
    }
}
