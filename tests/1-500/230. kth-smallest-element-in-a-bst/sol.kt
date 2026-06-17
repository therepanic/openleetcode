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
    fun kthSmallest(root: TreeNode?, k: Int): Int {
        fun inorderTraversal(node: TreeNode?): List<Int> {
            if (node == null) return emptyList()
            return inorderTraversal(node.left) + listOf(node.`val`) + inorderTraversal(node.right)
        }
        
        val sortedElements = inorderTraversal(root)
        return sortedElements[k - 1]
    }
}
