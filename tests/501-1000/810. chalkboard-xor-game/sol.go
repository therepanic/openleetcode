func xorGame(nums []int) bool {
    totalXor := 0
    for _, value := range nums {
        totalXor ^= value
    }
    
    isXorZero := (totalXor == 0)
    hasEvenLength := (len(nums) % 2 == 0)
    
    return isXorZero || hasEvenLength
}
