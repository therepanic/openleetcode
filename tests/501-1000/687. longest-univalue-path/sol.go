/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func longestUnivaluePath(root *TreeNode) int {
    ans := 0
    var solve func(*TreeNode) int
    solve = func(node *TreeNode) int {
        if node == nil {
            return 0
        }
        left := solve(node.Left)
        right := solve(node.Right)
        leftPath := 0
        rightPath := 0
        if node.Left != nil && node.Left.Val == node.Val {
            leftPath = left + 1
        }
        if node.Right != nil && node.Right.Val == node.Val {
            rightPath = right + 1
        }
        if leftPath + rightPath > ans {
            ans = leftPath + rightPath
        }
        if leftPath > rightPath {
            return leftPath
        }
        return rightPath
    }
    solve(root)
    return ans
}
