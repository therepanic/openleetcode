class Solution {
    func minAbsoluteSumDiff(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let MOD = 1_000_000_007
        let n = nums1.count
        let sortedNums1 = nums1.sorted()
        var total = 0
        var maxReduction = 0
        
        for i in 0..<n {
            let a = nums1[i]
            let b = nums2[i]
            let currDiff = abs(a - b)
            total += currDiff
            
            var idx = sortedNums1.binarySearch(b)
            if idx < 0 { idx = -idx - 1 }
            
            if idx < n {
                maxReduction = max(maxReduction, currDiff - abs(sortedNums1[idx] - b))
            }
            if idx > 0 {
                maxReduction = max(maxReduction, currDiff - abs(sortedNums1[idx - 1] - b))
            }
        }
        
        return (total - maxReduction) % MOD
    }
}

extension Array where Element: Comparable {
    func binarySearch(_ target: Element) -> Int {
        var low = 0
        var high = self.count
        while low < high {
            let mid = (low + high) / 2
            if self[mid] < target {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low < self.count && self[low] == target ? low : -low - 1
    }
}
