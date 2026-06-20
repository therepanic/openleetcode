
func minDepth(root *TreeNode) int {
    if root == nil {
        return 0
    }
    type item struct {
        node  *TreeNode
        depth int
    }
    queue := []item{{node: root, depth: 1}}
    for head := 0; head < len(queue); head++ {
        current := queue[head]
        if current.node.Left == nil && current.node.Right == nil {
            return current.depth
        }
        if current.node.Left != nil {
            queue = append(queue, item{node: current.node.Left, depth: current.depth + 1})
        }
        if current.node.Right != nil {
            queue = append(queue, item{node: current.node.Right, depth: current.depth + 1})
        }
    }
    return 0
}
