func sumOfFlooredPairs(nums []int) int {
    const MOD = 1_000_000_007
    maxi := 100_001
    maxVal := 0
    for _, num := range nums {
        if num > maxVal {
            maxVal = num
        }
    }
    size := 2*maxi + 1
    freq := make([]int, size)
    for _, num := range nums {
        freq[num]++
    }
    for i := 1; i < size; i++ {
        freq[i] += freq[i-1]
    }
    
    total := 0
    for num := 1; num <= maxVal; num++ {
        countNum := freq[num] - freq[num-1]
        if countNum == 0 {
            continue
        }
        floorValue := 1
        for floorValue*num <= maxVal {
            left := floorValue * num
            right := (floorValue+1)*num - 1
            if right > maxVal {
                right = maxVal
            }
            countInRange := freq[right] - freq[left-1]
            total = (total + countNum*floorValue*countInRange) % MOD
            floorValue++
        }
    }
    return total
}
