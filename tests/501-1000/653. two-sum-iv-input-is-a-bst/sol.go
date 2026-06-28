/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func findTarget(root *TreeNode, k int) bool {
    seen := make(map[int]bool)
    
    var dfs func(*TreeNode) bool
    dfs = func(node *TreeNode) bool {
        if node == nil {
            return false
        }
        if seen[k - node.Val] {
            return true
        }
        seen[node.Val] = true
        return dfs(node.Left) || dfs(node.Right)
    }
    
    return dfs(root)
}
