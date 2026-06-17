/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func countNodes(root *TreeNode) int {
    if root == nil {
        return 0
    }
    
    leftDepth := getDepth(root.Left)
    rightDepth := getDepth(root.Right)
    
    if leftDepth == rightDepth {
        return (1 << leftDepth) + countNodes(root.Right)
    } else {
        return (1 << rightDepth) + countNodes(root.Left)
    }
}

func getDepth(node *TreeNode) int {
    depth := 0
    for node != nil {
        depth++
        node = node.Left
    }
    return depth
}
