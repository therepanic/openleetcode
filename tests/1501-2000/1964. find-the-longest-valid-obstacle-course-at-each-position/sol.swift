class Solution {
    func longestObstacleCourseAtEachPosition(_ obstacles: [Int]) -> [Int] {
        var tails: [Int] = []
        var res: [Int] = []
        for x in obstacles {
            let idx = upperBound(tails, x)
            res.append(idx + 1)
            if idx == tails.count {
                tails.append(x)
            } else {
                tails[idx] = x
            }
        }
        return res
    }
    
    private func upperBound(_ arr: [Int], _ target: Int) -> Int {
        var lo = 0, hi = arr.count
        while lo < hi {
            let mid = lo + (hi - lo) / 2
            if arr[mid] <= target {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return lo
    }
}
