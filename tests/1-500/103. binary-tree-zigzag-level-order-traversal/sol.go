
func zigzagLevelOrder(root *TreeNode) [][]int {
    if root == nil {
        return [][]int{}
    }
    result := make([][]int, 0)
    queue := []*TreeNode{root}
    leftToRight := true
    for head := 0; head < len(queue); {
        size := len(queue) - head
        level := make([]int, size)
        for i := 0; i < size; i++ {
            node := queue[head]
            head++
            idx := i
            if !leftToRight {
                idx = size - 1 - i
            }
            level[idx] = node.Val
            if node.Left != nil {
                queue = append(queue, node.Left)
            }
            if node.Right != nil {
                queue = append(queue, node.Right)
            }
        }
        result = append(result, level)
        leftToRight = !leftToRight
    }
    return result
}
