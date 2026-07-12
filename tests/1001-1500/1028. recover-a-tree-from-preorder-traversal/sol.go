/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func recoverFromPreorder(traversal string) *TreeNode {
    stack := []*TreeNode{}
    var root *TreeNode
    i := 0
    n := len(traversal)
    for i < n {
        depth := 0
        for i < n && traversal[i] == '-' {
            depth++
            i++
        }
        num := 0
        for i < n && traversal[i] >= '0' && traversal[i] <= '9' {
            num = num*10 + int(traversal[i]-'0')
            i++
        }
        node := &TreeNode{Val: num}
        for len(stack) > depth {
            stack = stack[:len(stack)-1]
        }
        if len(stack) == 0 {
            root = node
        } else {
            parent := stack[len(stack)-1]
            if parent.Left == nil {
                parent.Left = node
            } else {
                parent.Right = node
            }
        }
        stack = append(stack, node)
    }
    return root
}
