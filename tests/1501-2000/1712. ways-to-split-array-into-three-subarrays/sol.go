func waysToSplit(nums []int) int {
    const MOD = 1000000007
    n := len(nums)
    prefix := make([]int64, n)
    prefix[0] = int64(nums[0])
    
    for i := 1; i < n; i++ {
        prefix[i] = prefix[i-1] + int64(nums[i])
    }
    
    res := int64(0)
    for i := 0; i < n-2; i++ {
        left := prefix[i]
        j := lowerBound(prefix, 2*left, i+1, n-1)
        k := upperBound(prefix, (prefix[n-1]+left)/2, j, n-1)
        if j < k {
            res = (res + int64(k-j)) % MOD
        }
    }
    return int(res)
}

func lowerBound(arr []int64, target int64, lo, hi int) int {
    l, h := lo, hi
    for l < h {
        mid := (l + h) / 2
        if arr[mid] < target {
            l = mid + 1
        } else {
            h = mid
        }
    }
    return l
}

func upperBound(arr []int64, target int64, lo, hi int) int {
    l, h := lo, hi
    for l < h {
        mid := (l + h) / 2
        if arr[mid] <= target {
            l = mid + 1
        } else {
            h = mid
        }
    }
    return l
}
