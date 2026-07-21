func groupThePeople(groupSizes []int) [][]int {
    ans := [][]int{}
    mp := map[int][]int{}
    for i, v := range groupSizes {
        mp[v] = append(mp[v], i)
        if len(mp[v]) == v {
            ans = append(ans, mp[v])
            mp[v] = []int{}
        }
    }
    return ans
}
