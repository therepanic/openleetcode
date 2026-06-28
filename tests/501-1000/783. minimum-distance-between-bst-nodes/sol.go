/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func minDiffInBST(root *TreeNode) int {
    prev := -1
    minDiff := int(^uint(0) >> 1)
    var inorder func(*TreeNode)
    inorder = func(node *TreeNode) {
        if node == nil {
            return
        }
        inorder(node.Left)
        if prev != -1 {
            diff := node.Val - prev
            if diff < minDiff {
                minDiff = diff
            }
        }
        prev = node.Val
        inorder(node.Right)
    }
    inorder(root)
    return minDiff
}
