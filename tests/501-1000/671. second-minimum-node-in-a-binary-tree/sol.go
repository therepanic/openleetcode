/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func findSecondMinimumValue(root *TreeNode) int {
    first := root.Val
    second := int(^uint(0) >> 1) // max int
    
    var dfs func(*TreeNode)
    dfs = func(node *TreeNode) {
        if node == nil {
            return
        }
        if first < node.Val && node.Val < second {
            second = node.Val
        }
        dfs(node.Left)
        dfs(node.Right)
    }
    
    dfs(root)
    if second == int(^uint(0) >> 1) {
        return -1
    }
    return second
}
