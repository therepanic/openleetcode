class Solution {
    func minOperations(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let x = nums1.reduce(0,+)
        let y = nums2.reduce(0,+)
        if x == y { return 0 }
        if x < y {
            if 6*nums1.count < nums2.count { return -1 }
            var gains = nums1.map { 6-$0 } + nums2.map { $0-1 }
            gains.sort(by: >)
            var diff = y - x
            var ops = 0
            for g in gains {
                if diff <= 0 { break }
                diff -= g
                ops += 1
            }
            return diff <= 0 ? ops : -1
        } else {
            if 6*nums2.count < nums1.count { return -1 }
            var gains = nums1.map { $0-1 } + nums2.map { 6-$0 }
            gains.sort(by: >)
            var diff = x - y
            var ops = 0
            for g in gains {
                if diff <= 0 { break }
                diff -= g
                ops += 1
            }
            return diff <= 0 ? ops : -1
        }
    }
}
