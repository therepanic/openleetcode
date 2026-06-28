func reconstructQueue(people [][]int) [][]int {
    sort.Slice(people, func(i, j int) bool {
        if people[i][0] != people[j][0] {
            return people[i][0] > people[j][0]
        }
        return people[i][1] < people[j][1]
    })
    q := make([][]int, 0, len(people))
    for _, p := range people {
        q = append(q[:p[1]], append([][]int{p}, q[p[1]:]...)...)
    }
    return q
}
