func minOperations(nums []int, x int) int {
    sub_sum := 0
    for _, num := range nums {
        sub_sum += num
    }
    sub_sum -= x
    n := len(nums)
    opes := n
    if sub_sum == 0 {
        return n
    }
    l, r, sld_sum := 0, 0, 0
    
    for r < n {
        if sld_sum == sub_sum {
            if n - (r - l) < opes {
                opes = n - (r - l)
            }
        }
        sld_sum += nums[r]
        for l < r && sld_sum > sub_sum {
            sld_sum -= nums[l]
            l++
        }
        r++
    }

    if sld_sum == sub_sum {
        if n - (r - l) < opes {
            opes = n - (r - l)
        }
    }

    if opes == n {
        return -1
    }
    return opes
}
