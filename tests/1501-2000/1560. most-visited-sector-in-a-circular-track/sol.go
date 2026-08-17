func mostVisited(n int, rounds []int) []int {
    s, e := rounds[0], rounds[len(rounds)-1]
    ans := []int{}
    if s <= e {
        for i := s; i <= e; i++ {
            ans = append(ans, i)
        }
    } else {
        for i := 1; i <= e; i++ {
            ans = append(ans, i)
        }
        for i := s; i <= n; i++ {
            ans = append(ans, i)
        }
    }
    return ans
}
