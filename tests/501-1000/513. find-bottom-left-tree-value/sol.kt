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
    fun findBottomLeftValue(root: TreeNode?): Int {
        val queue: java.util.Queue<TreeNode> = java.util.LinkedList()
        queue.offer(root!!)
        var leftmost = root.`val`

        while (queue.isNotEmpty()) {
            val levelSize = queue.size
            leftmost = queue.peek().`val`

            for (i in 0 until levelSize) {
                val node = queue.poll()
                if (node.left != null) {
                    queue.offer(node.left)
                }
                if (node.right != null) {
                    queue.offer(node.right)
                }
            }
        }

        return leftmost
    }
}
