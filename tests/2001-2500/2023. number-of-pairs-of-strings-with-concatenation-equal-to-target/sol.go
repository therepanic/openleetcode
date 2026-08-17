func numOfPairs(nums []string, target string) int {
    freq := make(map[string]int)
    for _, num := range nums {
        freq[num]++
    }

    totalCnt := 0

    for _, num := range nums {
        if strings.HasPrefix(target, num) {
            remain := target[len(num):]

            if remain == num {
                totalCnt += freq[remain] - 1
            } else {
                totalCnt += freq[remain]
            }
        }
    }

    return totalCnt
}
