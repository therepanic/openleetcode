func largestPerimeter(nums []int) int {
    minVal := nums[0]
    maxVal := nums[0]
    for _, x := range nums {
        if x < minVal {
            minVal = x
        }
        if x > maxVal {
            maxVal = x
        }
    }

    freq := make([]int, maxVal-minVal+1)
    for _, x := range nums {
        freq[x-minVal]++
    }

    idx := 0
    for v := maxVal; v >= minVal; v-- {
        for freq[v-minVal] > 0 {
            nums[idx] = v
            idx++
            freq[v-minVal]--
        }
    }

    for i := 0; i < len(nums)-2; i++ {
        if nums[i+1]+nums[i+2] > nums[i] {
            return nums[i] + nums[i+1] + nums[i+2]
        }
    }
    return 0
}
