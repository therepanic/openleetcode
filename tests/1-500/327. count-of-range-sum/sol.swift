class Solution {
    func countRangeSum(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
        var psum = [Int64](repeating: 0, count: nums.count + 1)
        psum[0] = 0
        for i in 0..<nums.count {
            psum[i + 1] = psum[i] + Int64(nums[i])
        }

        var slist = [Int64]()
        var result = 0
        for pval in psum.reversed() {
            let lo = pval + Int64(lower)
            let hi = pval + Int64(upper)

            let left = bisectLeft(slist, lo)
            let right = bisectRight(slist, hi)
            result += right - left

            let idx = bisectLeft(slist, pval)
            slist.insert(pval, at: idx)
        }

        return result
    }
}

private func bisectLeft(_ list: [Int64], _ target: Int64) -> Int {
    var lo = 0, hi = list.count
    while lo < hi {
        let mid = lo + (hi - lo) / 2
        if list[mid] < target {
            lo = mid + 1
        } else {
            hi = mid
        }
    }
    return lo
}

private func bisectRight(_ list: [Int64], _ target: Int64) -> Int {
    var lo = 0, hi = list.count
    while lo < hi {
        let mid = lo + (hi - lo) / 2
        if list[mid] <= target {
            lo = mid + 1
        } else {
            hi = mid
        }
    }
    return lo
}
