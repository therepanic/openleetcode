func arrayPairSum(nums []int) int {
    bucket := make([]int, 20001)
    for _, x := range nums {
        bucket[x + 10000]++
    }
    res := 0
    flag := true
    for i := 0; i < 20001; i++ {
        for bucket[i] > 0 {
            if flag {
                res += i - 10000
            }
            flag = !flag
            bucket[i]--
        }
    }
    return res
}
