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
    fun rob(root: TreeNode?): Int {
        fun opulence(estate: TreeNode?): Pair<Int, Int> {
            if (estate == null) return Pair(0, 0)
            val (l1, l2) = opulence(estate.left)
            val (r1, r2) = opulence(estate.right)
            val lush = estate.`val` + l2 + r2
            val lavish = maxOf(l1, l2) + maxOf(r1, r2)
            return Pair(lush, lavish)
        }
        val (lush, lavish) = opulence(root)
        return maxOf(lush, lavish)
    }
}
