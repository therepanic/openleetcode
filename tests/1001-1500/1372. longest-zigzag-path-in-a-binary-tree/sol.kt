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
    fun longestZigZag(root: TreeNode?): Int {
        if (root == null) return 0
        var best = 0
        val stack = ArrayDeque<Triple<TreeNode, Int, Int>>()
        stack.addLast(Triple(root, 0, 0))
        while (stack.isNotEmpty()) {
            val (node, endedLeft, endedRight) = stack.removeLast()
            best = maxOf(best, maxOf(endedLeft, endedRight))
            node.left?.let { stack.addLast(Triple(it, endedRight + 1, 0)) }
            node.right?.let { stack.addLast(Triple(it, 0, endedLeft + 1)) }
        }
        return best
    }
}
