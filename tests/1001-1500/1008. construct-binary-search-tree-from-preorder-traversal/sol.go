/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func bstFromPreorder(preorder []int) *TreeNode {
    if len(preorder) == 0 {
        return nil
    }
    var build func(start, end int) *TreeNode
    build = func(start, end int) *TreeNode {
        if start > end {
            return nil
        }
        root := &TreeNode{Val: preorder[start]}
        i := start + 1
        for i <= end && preorder[i] < root.Val {
            i++
        }
        root.Left = build(start+1, i-1)
        root.Right = build(i, end)
        return root
    }
    return build(0, len(preorder)-1)
}
