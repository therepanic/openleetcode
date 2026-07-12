func canThreePartsEqualSum(arr []int) bool {
    total := 0
    for _, num := range arr {
        total += num
    }
    if total%3 != 0 {
        return false
    }
    target := total / 3
    currentSum := 0
    partitions := 0
    for i, num := range arr {
        currentSum += num
        if currentSum == target {
            partitions++
            currentSum = 0
            if partitions == 2 && i < len(arr)-1 {
                return true
            }
        }
    }
    return false
}
