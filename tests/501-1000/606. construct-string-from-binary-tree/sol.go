import (
	"strconv"
)

/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func tree2str(root *TreeNode) string {
    if root == nil {
        return ""
    }
    s := strconv.Itoa(root.Val)
    if root.Left != nil || root.Right != nil {
        s += "(" + tree2str(root.Left) + ")"
    }
    if root.Right != nil {
        s += "(" + tree2str(root.Right) + ")"
    }
    return s
}
