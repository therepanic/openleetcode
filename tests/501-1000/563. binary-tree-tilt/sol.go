/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func findTilt(root *TreeNode) int {
    ans := 0
    var helper func(*TreeNode) int
    helper = func(n *TreeNode) int {
        if n == nil {
            return 0
        }
        l := helper(n.Left)
        r := helper(n.Right)
        diff := l - r
        if diff < 0 {
            diff = -diff
        }
        ans += diff
        return l + r + n.Val
    }
    helper(root)
    return ans
}
