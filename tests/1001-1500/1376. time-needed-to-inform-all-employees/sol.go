func numOfMinutes(n int, headID int, manager []int, informTime []int) int {
    children := make([][]int, n)
    for employee, parent := range manager {
        if parent != -1 {
            children[parent] = append(children[parent], employee)
        }
    }
    type pair struct {
        employee int
        elapsed  int
    }
    stack := []pair{{headID, 0}}
    answer := 0
    for len(stack) > 0 {
        p := stack[len(stack)-1]
        stack = stack[:len(stack)-1]
        if p.elapsed > answer {
            answer = p.elapsed
        }
        for _, child := range children[p.employee] {
            stack = append(stack, pair{child, p.elapsed + informTime[p.employee]})
        }
    }
    return answer
}
