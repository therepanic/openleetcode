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
    fun sumEvenGrandparent(root: TreeNode?): Int {
        val queue: java.util.ArrayDeque<Triple<TreeNode?, Int, Int>> = java.util.ArrayDeque()
        queue.add(Triple(root, -1, -1))
        var res = 0
        while (queue.isNotEmpty()) {
            val (node, parent, grandparent) = queue.removeFirst()
            if (node == null) continue
            if (grandparent % 2 == 0) {
                res += node.`val`
            }
            if (node.left != null) {
                queue.add(Triple(node.left, node.`val`, parent))
            }
            if (node.right != null) {
                queue.add(Triple(node.right, node.`val`, parent))
            }
        }
        return res
    }
}
