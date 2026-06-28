func deleteAndEarn(nums []int) int {
    count := make(map[int]int)
    for _, num := range nums {
        count[num]++
    }
    uniqueNums := make([]int, 0, len(count))
    for num := range count {
        uniqueNums = append(uniqueNums, num)
    }
    sort.Ints(uniqueNums)
    var prev *int = nil
    take, skip := 0, 0

    for _, num := range uniqueNums {
        maxPoints := max(skip, take)
        if prev != nil && *prev == num-1 {
            take = num*count[num] + skip
            skip = maxPoints
        } else {
            take = num*count[num] + maxPoints
            skip = maxPoints
        }
        prevCopy := num
        prev = &prevCopy
    }

    return max(take, skip)
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
