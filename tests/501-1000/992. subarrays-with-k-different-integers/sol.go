func subarraysWithKDistinct(nums []int, k int) int {
    atMost := func(k int) int {
        freq := make(map[int]int)
        count := 0
        left := 0
        n := len(nums)

        for right := 0; right < n; right++ {
            freq[nums[right]]++

            for len(freq) > k {
                if freq[nums[left]] > 1 {
                    freq[nums[left]]--
                } else {
                    delete(freq, nums[left])
                }
                left++
            }

            count += (right - left + 1)
        }

        return count
    }

    return atMost(k) - atMost(k-1)
}
