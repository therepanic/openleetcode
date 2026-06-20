/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func sumOfLeftLeaves(root *TreeNode) int {
    var dfs func(node *TreeNode, isLeft bool) int
    dfs = func(node *TreeNode, isLeft bool) int {
        if node == nil {
            return 0
        }
        if node.Left == nil && node.Right == nil {
            if isLeft {
                return node.Val
            }
            return 0
        }
        return dfs(node.Left, true) + dfs(node.Right, false)
    }
    return dfs(root, false)
}
