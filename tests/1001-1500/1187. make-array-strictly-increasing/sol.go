func makeArrayIncreasing(arr1 []int, arr2 []int) int {
    sort.Ints(arr2)
    memo := make(map[[2]int]int)
    
    var dfs func(int, int) int
    dfs = func(i int, prevMax int) int {
        if i == len(arr1) {
            return 0
        }
        key := [2]int{i, prevMax}
        if v, ok := memo[key]; ok {
            return v
        }
        
        j := bisectRight(arr2, prevMax)
        
        ans := math.MaxInt32 / 2
        if arr1[i] > prevMax {
            ans = min(ans, dfs(i+1, arr1[i]))
        }
        if j < len(arr2) {
            ans = min(ans, dfs(i+1, arr2[j])+1)
        }
        
        memo[key] = ans
        return ans
    }
    
    ops := dfs(0, math.MinInt32)
    if ops >= math.MaxInt32/2 {
        return -1
    }
    return ops
}

func bisectRight(arr []int, target int) int {
    lo, hi := 0, len(arr)
    for lo < hi {
        mid := lo + (hi-lo)/2
        if arr[mid] <= target {
            lo = mid + 1
        } else {
            hi = mid
        }
    }
    return lo
}
