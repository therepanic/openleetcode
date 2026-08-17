func findingUsersActiveMinutes(logs [][]int, k int) []int {
    mp := make(map[int]map[int]bool)
    for _, log := range logs {
        user := log[0]
        minute := log[1]
        if mp[user] == nil {
            mp[user] = make(map[int]bool)
        }
        mp[user][minute] = true
    }
    ans := make([]int, k)
    for _, set := range mp {
        size := len(set)
        if size <= k {
            ans[size-1]++
        }
    }
    return ans
}
