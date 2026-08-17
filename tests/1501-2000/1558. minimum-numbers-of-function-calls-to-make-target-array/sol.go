func minOperations(nums []int) int {
    sumBits := 0
    maxNum := 0
    for _, num := range nums {
        sumBits += bits.OnesCount(uint(num))
        if num > maxNum {
            maxNum = num
        }
    }
    doubling := 0
    if maxNum > 0 {
        doubling = bits.Len(uint(maxNum)) - 1
    }
    return sumBits + doubling
}
