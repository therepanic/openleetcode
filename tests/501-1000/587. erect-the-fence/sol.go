func outerTrees(trees [][]int) [][]int {
    if len(trees) == 1 {
        return trees
    }

    cross := func(o, a, b []int) int {
        return (a[0]-o[0])*(b[1]-o[1]) - (a[1]-o[1])*(b[0]-o[0])
    }

    sort.Slice(trees, func(i, j int) bool {
        if trees[i][0] == trees[j][0] {
            return trees[i][1] < trees[j][1]
        }
        return trees[i][0] < trees[j][0]
    })

    lower := [][]int{}
    for _, p := range trees {
        for len(lower) >= 2 && cross(lower[len(lower)-2], lower[len(lower)-1], p) < 0 {
            lower = lower[:len(lower)-1]
        }
        lower = append(lower, p)
    }

    upper := [][]int{}
    for i := len(trees) - 1; i >= 0; i-- {
        p := trees[i]
        for len(upper) >= 2 && cross(upper[len(upper)-2], upper[len(upper)-1], p) < 0 {
            upper = upper[:len(upper)-1]
        }
        upper = append(upper, p)
    }

    lower = lower[:len(lower)-1]
    upper = upper[:len(upper)-1]
    fullHull := append(lower, upper...)

    seen := make(map[string]bool)
    result := [][]int{}
    for _, p := range fullHull {
        key := fmt.Sprintf("%d,%d", p[0], p[1])
        if !seen[key] {
            seen[key] = true
            result = append(result, p)
        }
    }
    return result
}
