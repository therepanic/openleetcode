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
    fun isCompleteTree(root: TreeNode?): Boolean {
        val q: java.util.Queue<TreeNode?> = java.util.LinkedList()
        q.offer(root)
        var past = false
        while (!q.isEmpty()) {
            val node = q.poll()
            if (node == null) {
                past = true
            } else {
                if (past) return false
                q.offer(node.left)
                q.offer(node.right)
            }
        }
        return true
    }
}
