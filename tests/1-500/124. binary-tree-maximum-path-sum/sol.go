func maxPathSum(root *TreeNode) int {
    best := root.Val
    var dfs func(*TreeNode) int
    dfs = func(node *TreeNode) int {
        if node == nil {
            return 0
        }
        left := dfs(node.Left)
        if left < 0 {
            left = 0
        }
        right := dfs(node.Right)
        if right < 0 {
            right = 0
        }
        if node.Val+left+right > best {
            best = node.Val + left + right
        }
        if left > right {
            return node.Val + left
        }
        return node.Val + right
    }
    dfs(root)
    return best
}
