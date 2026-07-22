/**
 * Example:
 * var li = ListNode(5)
 * var v = li.`val`
 * Definition for singly-linked list.
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */
/**
 * Example:
 * var ti = TreeNode(5)
 * var v = ti.`val`
 * Definition for a binary tree node.
 * class TreeNode(var `val`: Int) {
 *     var left: TreeNode? = null
 *     var right: TreeNode? = null
 * }
 */
class Solution {
    private fun matches(node: TreeNode?, current: ListNode?): Boolean {
        if (current == null) return true
        if (node == null || node.`val` != current.`val`) return false
        return matches(node.left, current.next) || matches(node.right, current.next)
    }

    fun isSubPath(head: ListNode?, root: TreeNode?): Boolean {
        if (root == null) return false
        return matches(root, head) || isSubPath(head, root.left) || isSubPath(head, root.right)
    }
}
