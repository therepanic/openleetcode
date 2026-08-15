func canChoose(groups [][]int, nums []int) bool {
    i := 0
    for _, group := range groups {
        found := false
        for i + len(group) <= len(nums) {
            match := true
            for j := 0; j < len(group); j++ {
                if nums[i+j] != group[j] {
                    match = false
                    break
                }
            }
            if match {
                i += len(group)
                found = true
                break
            } else {
                i++
            }
        }
        if !found {
            return false
        }
    }
    return true
}
