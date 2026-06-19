func calcEquation(equations [][]string, values []float32, queries [][]string) []float64 {
    g := make(map[string]map[string]float64)
    for i, eq := range equations {
        a, b := eq[0], eq[1]
		v := float64(values[i])
        if g[a] == nil {
            g[a] = make(map[string]float64)
        }
        g[a][b] = v
        if g[b] == nil {
            g[b] = make(map[string]float64)
        }
        g[b][a] = 1.0 / v
    }
    
    var dfs func(string, string) float64
    dfs = func(x, y string) float64 {
        if _, ok := g[x]; !ok {
            return -1.0
        }
		if _, ok := g[y]; !ok {
			return -1.0
		}
		if x == y {
			return 1.0
		}
        type pair struct {
            s string
            v float64
        }
        stack := []pair{{x, 1.0}}
        visited := make(map[string]bool)
        for len(stack) > 0 {
            c := stack[len(stack)-1]
            stack = stack[:len(stack)-1]
            if c.s == y {
                return c.v
            }
            visited[c.s] = true
            for n, w := range g[c.s] {
                if !visited[n] {
                    stack = append(stack, pair{n, c.v * w})
                }
            }
        }
        return -1.0
    }
    
    res := make([]float64, len(queries))
    for i, q := range queries {
        res[i] = dfs(q[0], q[1])
    }
    return res
}
