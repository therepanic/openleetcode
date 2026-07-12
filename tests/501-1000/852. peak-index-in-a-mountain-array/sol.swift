class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var l = 0
        var r = arr.count - 1
        while l < r {
            let mid = (l + r) / 2
            if arr[mid] < arr[mid + 1] {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return l
    }
}
