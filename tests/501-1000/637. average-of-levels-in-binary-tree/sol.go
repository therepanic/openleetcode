func averageOfLevels(root *TreeNode) []float64 {
    if root == nil {
        return []float64{}
    }

    res := []float64{}
    queue := []*TreeNode{root}

    for len(queue) > 0 {
        levelSum := 0
        count := len(queue)

        for i := 0; i < count; i++ {
            node := queue[0]
            queue = queue[1:]
            levelSum += node.Val
            if node.Left != nil {
                queue = append(queue, node.Left)
            }
            if node.Right != nil {
                queue = append(queue, node.Right)
            }
        }

        res = append(res, float64(levelSum)/float64(count))
    }

    return res
}
