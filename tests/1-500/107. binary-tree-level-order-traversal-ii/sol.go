
func levelOrderBottom(root *TreeNode) [][]int {
    if root == nil {
        return [][]int{}
    }
    levels := make([][]int, 0)
    queue := []*TreeNode{root}
    for head := 0; head < len(queue); {
        size := len(queue) - head
        level := make([]int, 0, size)
        for i := 0; i < size; i++ {
            node := queue[head]
            head++
            level = append(level, node.Val)
            if node.Left != nil {
                queue = append(queue, node.Left)
            }
            if node.Right != nil {
                queue = append(queue, node.Right)
            }
        }
        levels = append(levels, level)
    }
    for i, j := 0, len(levels)-1; i < j; i, j = i+1, j-1 {
        levels[i], levels[j] = levels[j], levels[i]
    }
    return levels
}
