func largestMultipleOfThree(digits []int) string {
    counts := make([]int, 10)
    for _, digit := range digits {
        counts[digit]++
    }

    sum := 0
    for i := 0; i < 10; i++ {
        sum += i * counts[i]
    }
    remainder := sum % 3

    removeSmallest := func(group []int, amount int) bool {
        amt := amount
        for _, digit := range group {
            for amt > 0 && counts[digit] > 0 {
                counts[digit]--
                amt--
            }
        }
        return amt == 0
    }

    if remainder == 1 {
        if !removeSmallest([]int{1, 4, 7}, 1) {
            removeSmallest([]int{2, 5, 8}, 2)
        }
    } else if remainder == 2 {
        if !removeSmallest([]int{2, 5, 8}, 1) {
            removeSmallest([]int{1, 4, 7}, 2)
        }
    }

    var result []byte
    for i := 9; i >= 0; i-- {
        for j := 0; j < counts[i]; j++ {
            result = append(result, byte('0'+i))
        }
    }
    if len(result) > 0 && result[0] == '0' {
        return "0"
    }
    return string(result)
}
