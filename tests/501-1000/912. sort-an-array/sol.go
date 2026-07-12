func sortArray(nums []int) []int {
    var merge func(nums []int, l, mid, r int)
    merge = func(nums []int, l, mid, r int) {
        a := make([]int, mid-l+1)
        b := make([]int, r-mid)
        for i := l; i <= mid; i++ {
            a[i-l] = nums[i]
        }
        for j := mid + 1; j <= r; j++ {
            b[j-mid-1] = nums[j]
        }
        i, j, k := 0, 0, l
        for k <= r {
            if j == len(b) {
                nums[k] = a[i]
                i++
            } else if i == len(a) {
                nums[k] = b[j]
                j++
            } else if a[i] <= b[j] {
                nums[k] = a[i]
                i++
            } else {
                nums[k] = b[j]
                j++
            }
            k++
        }
    }

    var mergesort func(nums []int, l, r int)
    mergesort = func(nums []int, l, r int) {
        if l >= r {
            return
        }
        mid := (l + r) / 2
        mergesort(nums, l, mid)
        mergesort(nums, mid+1, r)
        merge(nums, l, mid, r)
    }

    mergesort(nums, 0, len(nums)-1)
    return nums
}
