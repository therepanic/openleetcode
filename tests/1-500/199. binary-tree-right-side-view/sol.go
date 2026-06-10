func rightSideView(root *TreeNode) []int {
    if root == nil {
        return []int{}
    }

    result := make([]int, 0)
    queue := []*TreeNode{root}
    for len(queue) > 0 {
        levelSize := len(queue)
        rightmost := 0
        for i := 0; i < levelSize; i++ {
            node := queue[0]
            queue = queue[1:]
            rightmost = node.Val
            if node.Left != nil {
                queue = append(queue, node.Left)
            }
            if node.Right != nil {
                queue = append(queue, node.Right)
            }
        }
        result = append(result, rightmost)
    }
    return result
}
