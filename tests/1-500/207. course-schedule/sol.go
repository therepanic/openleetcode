func canFinish(numCourses int, prerequisites [][]int) bool {
    graph := make([][]int, numCourses)
    indegree := make([]int, numCourses)
    for _, edge := range prerequisites {
        graph[edge[1]] = append(graph[edge[1]], edge[0])
        indegree[edge[0]]++
    }
    queue := make([]int, 0)
    for i := 0; i < numCourses; i++ {
        if indegree[i] == 0 {
            queue = append(queue, i)
        }
    }
    seen := 0
    for head := 0; head < len(queue); head++ {
        node := queue[head]
        seen++
        for _, nxt := range graph[node] {
            indegree[nxt]--
            if indegree[nxt] == 0 {
                queue = append(queue, nxt)
            }
        }
    }
    return seen == numCourses
}
