func buddyStrings(s string, goal string) bool {
    if len(s) != len(goal) {
        return false
    }
    if s == goal {
        seen := make(map[rune]bool)
        for _, c := range s {
            if seen[c] {
                return true
            }
            seen[c] = true
        }
        return false
    }
    diffs := []int{}
    for i := 0; i < len(s); i++ {
        if s[i] != goal[i] {
            diffs = append(diffs, i)
        }
    }
    return len(diffs) == 2 && s[diffs[0]] == goal[diffs[1]] && s[diffs[1]] == goal[diffs[0]]
}
