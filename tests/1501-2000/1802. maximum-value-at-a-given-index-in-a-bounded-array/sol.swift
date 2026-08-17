class Solution {
    func maxValue(_ n: Int, _ index: Int, _ maxSum: Int) -> Int {
        var l = 0, r = maxSum, result = 1
        while l <= r {
            let mid = (l + r) / 2
            if isValid(mid, n, index, maxSum) {
                result = mid
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return result
    }

    private func isValid(_ mid: Int, _ n: Int, _ index: Int, _ maxSum: Int) -> Bool {
        let leftCount = index
        var left: Int
        if mid > leftCount {
            left = (mid - leftCount + mid - 1) * leftCount / 2
        } else {
            let ones = leftCount - (mid - 1)
            left = mid * (mid - 1) / 2 + ones
        }

        let rightCount = n - index - 1
        var right: Int
        if mid > rightCount {
            right = (mid - 1 + mid - rightCount) * rightCount / 2
        } else {
            let ones = rightCount - (mid - 1)
            right = mid * (mid - 1) / 2 + ones
        }

        return left + mid + right <= maxSum
    }
}
