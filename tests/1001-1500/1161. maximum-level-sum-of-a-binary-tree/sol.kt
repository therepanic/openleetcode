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
    fun maxLevelSum(root: TreeNode?): Int {
        var idx = 0
        var maxSum = Int.MIN_VALUE
        val q: java.util.Queue<TreeNode> = java.util.LinkedList()
        q.offer(root)
        var level = 1
        while (q.isNotEmpty()) {
            val qz = q.size
            var curSum = 0
            repeat(qz) {
                val node = q.poll()
                curSum += node.`val`
                node.left?.let { q.offer(it) }
                node.right?.let { q.offer(it) }
            }
            if (curSum > maxSum) {
                idx = level
                maxSum = curSum
            }
            level++
        }
        return idx
    }
}
