func minMutation(startGene string, endGene string, bank []string) int {
    s := make(map[string]bool)
    for _, b := range bank {
        s[b] = true
    }
    if !s[endGene] && startGene != endGene {
        return -1
    }
    type pair struct {
        gene string
        dist int
    }
    q := []pair{{startGene, 0}}
    v := map[string]bool{startGene: true}
    choices := []byte{'A', 'C', 'G', 'T'}
    for len(q) > 0 {
        g, d := q[0].gene, q[0].dist
        q = q[1:]
        if g == endGene {
            return d
        }
        for i := 0; i < 8; i++ {
            for _, c := range choices {
                if g[i] != c {
                    n := g[:i] + string(c) + g[i+1:]
                    if s[n] && !v[n] {
                        v[n] = true
                        q = append(q, pair{n, d+1})
                    }
                }
            }
        }
    }
    return -1
}
