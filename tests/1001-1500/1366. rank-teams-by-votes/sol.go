func rankTeams(votes []string) string {
    teams := votes[0]
    n := len(teams)
    positions := make(map[rune][]int)
    for _, team := range teams {
        positions[team] = make([]int, n)
    }
    for _, vote := range votes {
        for i, team := range vote {
            positions[team][i]++
        }
    }
    sortedTeams := []rune(teams)
    sort.Slice(sortedTeams, func(i, j int) bool {
        a := sortedTeams[i]
        b := sortedTeams[j]
        countsA := positions[a]
        countsB := positions[b]
        for k := 0; k < n; k++ {
            if countsA[k] != countsB[k] {
                return countsA[k] > countsB[k]
            }
        }
        return a < b
    })
    return string(sortedTeams)
}
