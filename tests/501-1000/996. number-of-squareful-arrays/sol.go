func numSquarefulPerms(nums []int) int {
    n := len(nums)
    sort.Ints(nums)

    isSquareful := func(currNums []int, num int) bool {
        if len(currNums) == 0 {
            return true
        }
        prevNum := currNums[len(currNums)-1]
        pairSum := prevNum + num
        if pairSum < 0 {
            return false
        }
        sqrtN := int(math.Sqrt(float64(pairSum)))
        return sqrtN*sqrtN == pairSum
    }

    var backtrack func(int, []int) int
    backtrack = func(numsMask int, currNums []int) int {
        if numsMask != 0 && len(currNums) == n {
            return 1
        }
        numSquarefulPerms := 0
        for idx := 0; idx < n; idx++ {
            num := nums[idx]
            if idx > 0 && nums[idx] == nums[idx-1] && (numsMask & (1 << (idx - 1))) == 0 {
                continue
            }
            if (numsMask & (1 << idx)) == 0 && isSquareful(currNums, num) {
                currNums = append(currNums, num)
                numSquarefulPerms += backtrack(numsMask | (1 << idx), currNums)
                currNums = currNums[:len(currNums)-1]
            }
        }
        return numSquarefulPerms
    }

    return backtrack(0, []int{})
}
