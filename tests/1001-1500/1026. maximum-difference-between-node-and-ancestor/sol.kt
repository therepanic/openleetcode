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
    fun maxAncestorDiff(root: TreeNode?): Int {
        val m = intArrayOf(0)
        dfs(root, m)
        return m[0]
    }
    
    private fun dfs(root: TreeNode?, m: IntArray): IntArray {
        if (root == null) {
            return intArrayOf(Int.MAX_VALUE, Int.MIN_VALUE)
        }
        val left = dfs(root.left, m)
        val right = dfs(root.right, m)
        val minVal = minOf(root.`val`, minOf(left[0], right[0]))
        val maxVal = maxOf(root.`val`, maxOf(left[1], right[1]))
        m[0] = maxOf(m[0], maxOf(Math.abs(minVal - root.`val`), Math.abs(maxVal - root.`val`)))
        return intArrayOf(minVal, maxVal)
    }
}
