/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func getMinimumDifference(root *TreeNode) int {
    prev := -1
    ans := int(^uint(0) >> 1) // max int
    var dfs func(*TreeNode)
    dfs = func(node *TreeNode) {
        if node == nil {
            return
        }
        dfs(node.Left)
        if prev != -1 {
            diff := node.Val - prev
            if diff < ans {
                ans = diff
            }
        }
        prev = node.Val
        dfs(node.Right)
    }
    dfs(root)
    return ans
}
