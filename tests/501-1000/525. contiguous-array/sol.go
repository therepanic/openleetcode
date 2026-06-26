func findMaxLength(nums []int) int {
    count := 0
    maxLength := 0
    countMap := map[int]int{0: -1}

    for i, num := range nums {
        if num == 0 {
            count--
        } else {
            count++
        }

        if prevIndex, ok := countMap[count]; ok {
            if i - prevIndex > maxLength {
                maxLength = i - prevIndex
            }
        } else {
            countMap[count] = i
        }
    }

    return maxLength
}
