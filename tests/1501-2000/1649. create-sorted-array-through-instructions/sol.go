func createSortedArray(instructions []int) int {
    n := len(instructions)
    nums := instructions
    ans := make([][2]int, n)
    
    arr := make([]int, n)
    for i := 0; i < n; i++ {
        arr[i] = i
    }
    
    var merge func([]int, []int) []int
    merge = func(left, right []int) []int {
        l := len(left) - 1
        r := len(right) - 1
        for l > -1 && r > -1 {
            if nums[left[l]] <= nums[right[r]] {
                ans[right[r]][1] += (len(left) - 1) - l
                r--
            } else {
                l--
            }
        }
        for r > -1 {
            ans[right[r]][1] += len(left)
            r--
        }
        
        l = 0
        r = 0
        res := make([]int, 0, len(left)+len(right))
        for l < len(left) && r < len(right) {
            if nums[left[l]] < nums[right[r]] {
                res = append(res, left[l])
                l++
            } else {
                ans[right[r]][0] += l
                res = append(res, right[r])
                r++
            }
        }
        for r < len(right) {
            ans[right[r]][0] += l
            res = append(res, right[r])
            r++
        }
        res = append(res, left[l:]...)
        return res
    }
    
    var split func(int, int, []int) []int
    split = func(l, r int, arr []int) []int {
        if l == r {
            return []int{arr[r]}
        }
        mid := (l + r) / 2
        left := split(l, mid, arr)
        right := split(mid+1, r, arr)
        return merge(left, right)
    }
    
    split(0, n-1, arr)
    
    realAns := 0
    for i := 0; i < n; i++ {
        if ans[i][0] < ans[i][1] {
            realAns += ans[i][0]
        } else {
            realAns += ans[i][1]
        }
    }
    return realAns % 1000000007
}
