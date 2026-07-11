class Solution {
    func minSwap(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count
        var keep = 0
        var swap = 1
        
        for i in 1..<n {
            let inc = nums1[i] > nums1[i - 1] && nums2[i] > nums2[i - 1]
            let cross = nums1[i] > nums2[i - 1] && nums2[i] > nums1[i - 1]
            
            if inc && cross {
                let m = min(keep, swap)
                keep = m
                swap = m + 1
            } else if inc {
                swap += 1
            } else {
                let temp = keep
                keep = swap
                swap = temp + 1
            }
        }
        
        return min(keep, swap)
    }
}
