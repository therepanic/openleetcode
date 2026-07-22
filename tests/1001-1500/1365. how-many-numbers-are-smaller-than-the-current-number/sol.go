func smallerNumbersThanCurrent(nums []int) []int {
    allNums := make([]int, 101)
    res := make([]int, len(nums))

    for _, v := range nums {
        allNums[v]++
    }

    for v := 1; v <= 100; v++ {
        allNums[v] += allNums[v-1]
    }

    for i, v := range nums {
        if v == 0 {
            res[i] = 0
        } else {
            res[i] = allNums[v-1]
        }
    }
    return res
}
