/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func balanceBST(root *TreeNode) *TreeNode {
    var vals []int
    inorder(root, &vals)
    return build(vals, 0, len(vals)-1)
}

func inorder(node *TreeNode, vals *[]int) {
    if node == nil {
        return
    }
    inorder(node.Left, vals)
    *vals = append(*vals, node.Val)
    inorder(node.Right, vals)
}

func build(vals []int, l, r int) *TreeNode {
    if l > r {
        return nil
    }
    mid := (l + r) / 2
    node := &TreeNode{Val: vals[mid]}
    node.Left = build(vals, l, mid-1)
    node.Right = build(vals, mid+1, r)
    return node
}
