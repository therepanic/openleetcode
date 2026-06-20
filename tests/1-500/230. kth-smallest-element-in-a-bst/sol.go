/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func kthSmallest(root *TreeNode, k int) int {
    var inorderTraversal func(node *TreeNode) []int
    inorderTraversal = func(node *TreeNode) []int {
        if node == nil {
            return []int{}
        }
        left := inorderTraversal(node.Left)
        right := inorderTraversal(node.Right)
        result := append(left, node.Val)
        result = append(result, right...)
        return result
    }
    
    sortedElements := inorderTraversal(root)
    return sortedElements[k-1]
}
