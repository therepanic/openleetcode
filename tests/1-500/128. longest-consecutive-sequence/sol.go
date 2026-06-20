func longestConsecutive(nums []int) int {
    seen := make(map[int]bool, len(nums))
    for _, num := range nums { seen[num] = true }
    best := 0
    for num := range seen {
        if seen[num-1] { continue }
        current := num
        streak := 1
        for seen[current+1] { current++; streak++ }
        if streak > best { best = streak }
    }
    return best
}
