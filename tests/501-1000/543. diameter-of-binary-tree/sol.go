/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func diameterOfBinaryTree(root *TreeNode) int {
    var height func(node *TreeNode) int
    height = func(node *TreeNode) int {
        if node == nil {
            return 0
        }
        leftHeight := height(node.Left)
        rightHeight := height(node.Right)
        if leftHeight > rightHeight {
            return 1 + leftHeight
        }
        return 1 + rightHeight
    }
    
    var diameter func(node *TreeNode) int
    diameter = func(node *TreeNode) int {
        if node == nil {
            return 0
        }
        diameterThroughNode := height(node.Left) + height(node.Right)
        leftDiameter := diameter(node.Left)
        rightDiameter := diameter(node.Right)
        result := diameterThroughNode
        if leftDiameter > result {
            result = leftDiameter
        }
        if rightDiameter > result {
            result = rightDiameter
        }
        return result
    }
    
    return diameter(root)
}
