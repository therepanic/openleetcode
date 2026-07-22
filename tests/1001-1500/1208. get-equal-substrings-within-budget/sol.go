func equalSubstring(s string, t string, maxCost int) int {
    ans, cost, left := 0, 0, 0
    for right := 0; right < len(s); right++ {
        cost += abs(int(s[right]) - int(t[right]))
        for cost > maxCost {
            cost -= abs(int(s[left]) - int(t[left]))
            left++
        }
        size := right - left + 1
        if size > ans {
            ans = size
        }
    }
    return ans
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
