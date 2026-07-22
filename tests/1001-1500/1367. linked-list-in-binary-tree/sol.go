/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func isSubPath(head *ListNode, root *TreeNode) bool {
    var matches func(node *TreeNode, current *ListNode) bool
    matches = func(node *TreeNode, current *ListNode) bool {
        if current == nil {
            return true
        }
        if node == nil || node.Val != current.Val {
            return false
        }
        return matches(node.Left, current.Next) || matches(node.Right, current.Next)
    }
    
    if root == nil {
        return false
    }
    return matches(root, head) || isSubPath(head, root.Left) || isSubPath(head, root.Right)
}
