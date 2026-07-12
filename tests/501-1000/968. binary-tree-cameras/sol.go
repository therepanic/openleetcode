/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func minCameraCover(root *TreeNode) int {
    var dfs func(*TreeNode) int
    dfs = func(node *TreeNode) int {
        if node == nil {
            return 0
        }
        res := dfs(node.Left) + dfs(node.Right)
        curr := int(^uint(0) >> 1)
        if node.Left != nil && node.Left.Val < curr {
            curr = node.Left.Val
        }
        if node.Right != nil && node.Right.Val < curr {
            curr = node.Right.Val
        }
        if curr == 0 {
            node.Val = 1
            res += 1
        } else if curr == 1 {
            node.Val = 2
        }
        return res
    }
    ans := dfs(root)
    if root.Val == 0 {
        ans += 1
    }
    return ans
}
