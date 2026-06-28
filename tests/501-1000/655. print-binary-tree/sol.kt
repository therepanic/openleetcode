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
    private fun findHeight(node: TreeNode?): Int {
        if (node == null) return 0
        var height = 0
        if (node.left != null) {
            height = maxOf(height, 1 + findHeight(node.left))
        }
        if (node.right != null) {
            height = maxOf(height, 1 + findHeight(node.right))
        }
        return height
    }

    fun printTree(root: TreeNode?): List<List<String>> {
        val height = findHeight(root)
        val m = height + 1
        val n = (1 shl (height + 1)) - 1
        val matrix = MutableList(m) { MutableList(n) { "" } }
        val queue: java.util.ArrayDeque<Triple<TreeNode, Int, Int>> = java.util.ArrayDeque()
        queue.add(Triple(root!!, 0, (n - 1) / 2))
        while (queue.isNotEmpty()) {
            val levelSize = queue.size
            repeat(levelSize) {
                val (frontNode, x, y) = queue.removeFirst()
                matrix[x][y] = frontNode.`val`.toString()
                frontNode.left?.let {
                    queue.add(Triple(it, x + 1, y - (1 shl (height - x - 1))))
                }
                frontNode.right?.let {
                    queue.add(Triple(it, x + 1, y + (1 shl (height - x - 1))))
                }
            }
        }
        return matrix
    }
}
