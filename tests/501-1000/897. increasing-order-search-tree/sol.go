/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func increasingBST(root *TreeNode) *TreeNode {
    vals := []int{}
    inord(root, &vals)
    return create(vals, 0)
}

func create(vals []int, i int) *TreeNode {
    if i >= len(vals) {
        return nil
    }
    node := &TreeNode{Val: vals[i]}
    node.Right = create(vals, i + 1)
    return node
}

func inord(root *TreeNode, vals *[]int) {
    if root == nil {
        return
    }
    inord(root.Left, vals)
    *vals = append(*vals, root.Val)
    inord(root.Right, vals)
}
