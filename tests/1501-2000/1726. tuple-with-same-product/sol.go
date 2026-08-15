func tupleSameProduct(nums []int) int {
    productCount := make(map[int]int)
    ans := 0

    for i := 0; i < len(nums); i++ {
        for j := i+1; j < len(nums); j++ {
            product := nums[i] * nums[j]
            ans += 8 * productCount[product]
            productCount[product]++
        }
    }

    return ans
}
