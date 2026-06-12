
func hasPathSum(root *TreeNode, targetSum int) bool {
    if root == nil {
        return false
    }
    if root.Left == nil && root.Right == nil {
        return root.Val == targetSum
    }
    remaining := targetSum - root.Val
    return hasPathSum(root.Left, remaining) || hasPathSum(root.Right, remaining)
}
