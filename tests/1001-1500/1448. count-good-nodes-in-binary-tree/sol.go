/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func goodNodes(root *TreeNode) int {
    var dfs func(*TreeNode, int) int
    dfs = func(node *TreeNode, maxSoFar int) int {
        if node == nil {
            return 0
        }
        count := 0
        if node.Val >= maxSoFar {
            count = 1
        }
        newMax := maxSoFar
        if node.Val > newMax {
            newMax = node.Val
        }
        count += dfs(node.Left, newMax)
        count += dfs(node.Right, newMax)
        return count
    }
    return dfs(root, root.Val)
}
