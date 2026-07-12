func intervalIntersection(firstList [][]int, secondList [][]int) [][]int {
    if len(firstList) == 0 || len(secondList) == 0 {
        return [][]int{}
    }
    
    n, m := len(firstList), len(secondList)
    res := [][]int{}
    i, j := 0, 0
    
    for i < n && j < m {
        s1, e1 := firstList[i][0], firstList[i][1]
        s2, e2 := secondList[j][0], secondList[j][1]
        
        if e1 >= s2 && s1 <= e2 {
            start := s1
            if s2 > start {
                start = s2
            }
            end := e1
            if e2 < end {
                end = e2
            }
            res = append(res, []int{start, end})
        }
        
        if e1 > e2 {
            j++
        } else {
            i++
        }
    }
    
    return res
}
