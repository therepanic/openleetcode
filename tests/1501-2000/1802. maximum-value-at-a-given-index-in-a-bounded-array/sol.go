func maxValue(n int, index int, maxSum int) int {
    l := int64(0)
    r := int64(maxSum)
    result := int64(1)
    for l <= r {
        mid := (l + r) / 2
        if isValid(mid, int64(n), int64(index), int64(maxSum)) {
            result = mid
            l = mid + 1
        } else {
            r = mid - 1
        }
    }
    return int(result)
}

func isValid(mid int64, n int64, index int64, maxSum int64) bool {
    leftCount := index
    var left int64
    if mid > leftCount {
        left = (mid - leftCount + mid - 1) * leftCount / 2
    } else {
        ones := leftCount - (mid - 1)
        left = mid*(mid-1)/2 + ones
    }

    rightCount := n - index - 1
    var right int64
    if mid > rightCount {
        right = (mid - 1 + mid - rightCount) * rightCount / 2
    } else {
        ones := rightCount - (mid - 1)
        right = mid*(mid-1)/2 + ones
    }

    return left + mid + right <= maxSum
}
