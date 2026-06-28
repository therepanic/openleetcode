/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func constructMaximumBinaryTree(nums []int) *TreeNode {
    stack := []*TreeNode{}
    
    for _, num := range nums {
        current := &TreeNode{Val: num}
        
        for len(stack) > 0 && stack[len(stack)-1].Val < num {
            current.Left = stack[len(stack)-1]
            stack = stack[:len(stack)-1]
        }
        
        if len(stack) > 0 {
            stack[len(stack)-1].Right = current
        }
        
        stack = append(stack, current)
    }
    
    return stack[0]
}
