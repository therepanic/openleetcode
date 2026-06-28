/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func isSubtree(root *TreeNode, subRoot *TreeNode) bool {
    var ser func(n *TreeNode) string
    ser = func(n *TreeNode) string {
        if n == nil {
            return ",#"
        }
        return "," + strconv.Itoa(n.Val) + ser(n.Left) + ser(n.Right)
    }
    return strings.Contains(ser(root), ser(subRoot))
}
