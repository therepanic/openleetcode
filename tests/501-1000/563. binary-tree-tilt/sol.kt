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
    private var ans = 0
    fun findTilt(root: TreeNode?): Int {
        ans = 0
        helper(root)
        return ans
    }
    private fun helper(n: TreeNode?): Int {
        if (n == null) return 0
        val l = helper(n.left)
        val r = helper(n.right)
        ans += Math.abs(l - r)
        return l + r + n.`val`
    }
}
