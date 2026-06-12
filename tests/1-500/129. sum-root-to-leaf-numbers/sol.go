func sumNumbers(root *TreeNode) int {
    var dfs func(*TreeNode, int) int
    dfs = func(node *TreeNode, current int) int {
        if node == nil { return 0 }
        current = current*10 + node.Val
        if node.Left == nil && node.Right == nil { return current }
        return dfs(node.Left, current) + dfs(node.Right, current)
    }
    return dfs(root, 0)
}
