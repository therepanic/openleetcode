/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func largestValues(root *TreeNode) []int {
    res := []int{}
    var dfs func(*TreeNode, int)
    dfs = func(node *TreeNode, level int) {
        if node == nil {
            return
        }
        if level == len(res) {
            res = append(res, node.Val)
        } else {
            if node.Val > res[level] {
                res[level] = node.Val
            }
        }
        dfs(node.Left, level + 1)
        dfs(node.Right, level + 1)
    }
    dfs(root, 0)
    return res
}
