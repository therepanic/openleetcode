func minNumberOfSemesters(n int, relations [][]int, k int) int {
    graph := make([][]int, n)
    inDegrees := make([]int, n)
    for _, rel := range relations {
        prev := rel[0] - 1
        next := rel[1] - 1
        inDegrees[next]++
        graph[prev] = append(graph[prev], next)
    }
    
    memo := make(map[string]int)
    
    var recurse func(int, []int) int
    recurse = func(mask int, inDeg []int) int {
        if mask == 0 {
            return 0
        }
        key := fmt.Sprintf("%d-%v", mask, inDeg)
        if val, ok := memo[key]; ok {
            return val
        }
        
        nodes := []int{}
        for i := 0; i < n; i++ {
            if (mask & (1 << i)) != 0 && inDeg[i] == 0 {
                nodes = append(nodes, i)
            }
        }
        
        ans := int(^uint(0) >> 1) // max int
        combLimit := k
        if len(nodes) < combLimit {
            combLimit = len(nodes)
        }
        
        combos := combinations(nodes, combLimit)
        for _, kNodes := range combos {
            newMask := mask
            newInDeg := make([]int, len(inDeg))
            copy(newInDeg, inDeg)
            for _, node := range kNodes {
                newMask ^= (1 << node)
                for _, child := range graph[node] {
                    newInDeg[child]--
                }
            }
            ans = min(ans, 1 + recurse(newMask, newInDeg))
        }
        memo[key] = ans
        return ans
    }
    
    return recurse((1<<n)-1, inDegrees)
}

func combinations(arr []int, k int) [][]int {
    var res [][]int
    var helper func(start int, current []int)
    helper = func(start int, current []int) {
        if len(current) == k {
            combo := make([]int, k)
            copy(combo, current)
            res = append(res, combo)
            return
        }
        for i := start; i < len(arr); i++ {
            current = append(current, arr[i])
            helper(i+1, current)
            current = current[:len(current)-1]
        }
    }
    helper(0, []int{})
    return res
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}
