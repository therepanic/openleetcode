func validateBinaryTreeNodes(n int, leftChild []int, rightChild []int) bool {
    inDegree := make([]int, n)
    for i := 0; i < n; i++ {
        for _, child := range []int{leftChild[i], rightChild[i]} {
            if child != -1 {
                if child < 0 || child >= n {
                    return false
                }
                inDegree[child]++
                if inDegree[child] > 1 {
                    return false
                }
            }
        }
    }

    root := -1
    for i, x := range inDegree {
        if x == 0 {
            if root != -1 {
                return false
            }
            root = i
        }
    }
    if root == -1 {
        return false
    }

    queue := []int{root}
    visited := make([]bool, n)
    visited[root] = true
    count := 1

    for len(queue) > 0 {
        node := queue[0]
        queue = queue[1:]
        for _, child := range []int{leftChild[node], rightChild[node]} {
            if child == -1 {
                continue
            }
            if visited[child] {
                return false
            }
            visited[child] = true
            count++
            queue = append(queue, child)
        }
    }
    return count == n
}
