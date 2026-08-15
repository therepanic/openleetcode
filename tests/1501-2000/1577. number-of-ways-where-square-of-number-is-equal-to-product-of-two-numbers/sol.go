func numTriplets(nums1 []int, nums2 []int) int {
    countPairs := func(numsA, numsB []int) int {
        freq := make(map[int]int)
        for i := 0; i < len(numsB); i++ {
            for j := i + 1; j < len(numsB); j++ {
                prod := numsB[i] * numsB[j]
                freq[prod]++
            }
        }
        count := 0
        for _, num := range numsA {
            count += freq[num*num]
        }
        return count
    }
    return countPairs(nums1, nums2) + countPairs(nums2, nums1)
}
