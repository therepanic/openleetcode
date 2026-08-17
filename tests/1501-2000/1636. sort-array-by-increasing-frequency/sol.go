func frequencySort(nums []int) []int {
    freq := make(map[int]int)
    for _, num := range nums {
        freq[num]++
    }
    sort.Slice(nums, func(i, j int) bool {
        if freq[nums[i]] != freq[nums[j]] {
            return freq[nums[i]] < freq[nums[j]]
        }
        return nums[i] > nums[j]
    })
    return nums
}
