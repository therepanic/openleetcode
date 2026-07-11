/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func isCompleteTree(root *TreeNode) bool {
    q := []*TreeNode{root}
    past := false
    for len(q) > 0 {
        node := q[0]
        q = q[1:]
        if node == nil {
            past = true
        } else {
            if past {
                return false
            }
            q = append(q, node.Left)
            q = append(q, node.Right)
        }
    }
    return true
}
