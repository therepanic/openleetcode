/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func addOneRow(root *TreeNode, val int, depth int) *TreeNode {
    if depth == 1 {
        newRoot := &TreeNode{Val: val}
        newRoot.Left = root
        return newRoot
    }
    var construct func(temp *TreeNode, count int)
    construct = func(temp *TreeNode, count int) {
        if temp == nil {
            return
        }
        if count == depth-1 {
            newLeft := &TreeNode{Val: val}
            newLeft.Left = temp.Left
            temp.Left = newLeft
            
            newRight := &TreeNode{Val: val}
            newRight.Right = temp.Right
            temp.Right = newRight
            return
        }
        construct(temp.Left, count+1)
        construct(temp.Right, count+1)
    }
    construct(root, 1)
    return root
}
