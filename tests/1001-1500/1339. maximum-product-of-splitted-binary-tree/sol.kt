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
    fun maxProduct(root: TreeNode?): Int {
        val mod = 1_000_000_007
        fun sum(node: TreeNode?): Long = node?.let { it.`val`.toLong() + sum(it.left) + sum(it.right) } ?: 0L
        val total = sum(root)
        var best = 0L
        fun visit(node: TreeNode?): Long {
            if (node == null) return 0L
            val sub = node.`val`.toLong() + visit(node.left) + visit(node.right)
            best = maxOf(best, sub * (total - sub))
            return sub
        }
        visit(root)
        return (best % mod).toInt()
    }
}
