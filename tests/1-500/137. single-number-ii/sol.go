func singleNumber(nums []int) int {
    totalSum := int64(0)
    seen := make(map[int]bool, len(nums))
    for _, num := range nums {
        totalSum += int64(num)
        seen[num] = true
    }
    uniqueSum := int64(0)
    for num := range seen {
        uniqueSum += int64(num)
    }
    numerator := 3*uniqueSum - totalSum
    return int(numerator >> 1)
}
