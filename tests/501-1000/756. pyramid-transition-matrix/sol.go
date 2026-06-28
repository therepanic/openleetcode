func pyramidTransition(bottom string, allowed []string) bool {
    tab := make(map[string]map[byte]bool)
    for _, a := range allowed {
        key := string([]byte{a[0], a[1]})
        if tab[key] == nil {
            tab[key] = make(map[byte]bool)
        }
        tab[key][a[2]] = true
    }
    
    visited := make(map[string]bool)
    
    var addNeighbor func(string) []string
    addNeighbor = func(node string) []string {
        res := []string{""}
        for i := 1; i < len(node); i++ {
            key := string([]byte{node[i-1], node[i]})
            chars, ok := tab[key]
            if !ok || len(chars) == 0 {
                return []string{}
            }
            newRes := []string{}
            for _, r := range res {
                for c := range chars {
                    newRes = append(newRes, r+string(c))
                }
            }
            res = newRes
        }
        return res
    }
    
    var dfs func(string) bool
    dfs = func(node string) bool {
        if len(node) == 1 {
            return true
        }
        if visited[node] {
            return false
        }
        
        for _, nxt := range addNeighbor(node) {
            if dfs(nxt) {
                return true
            }
        }
        
        visited[node] = true
        return false
    }
    
    return dfs(bottom)
}
