/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func leafSimilar(root1 *TreeNode, root2 *TreeNode) bool {
    helper := func(root *TreeNode) []int {
        leaves := []int{}
        if root == nil {
            return leaves
        }
        stack := []*TreeNode{root}
        for len(stack) > 0 {
            curr := stack[len(stack)-1]
            stack = stack[:len(stack)-1]
            if curr.Left == nil && curr.Right == nil {
                leaves = append(leaves, curr.Val)
            }
            if curr.Right != nil {
                stack = append(stack, curr.Right)
            }
            if curr.Left != nil {
                stack = append(stack, curr.Left)
            }
        }
        return leaves
    }
    leaves1 := helper(root1)
    leaves2 := helper(root2)
    if len(leaves1) != len(leaves2) {
        return false
    }
    for i := range leaves1 {
        if leaves1[i] != leaves2[i] {
            return false
        }
    }
    return true
}
