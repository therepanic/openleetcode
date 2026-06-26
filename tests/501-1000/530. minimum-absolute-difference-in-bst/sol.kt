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
    private var prev: Int? = null
    private var ans: Int = Int.MAX_VALUE

    fun getMinimumDifference(root: TreeNode?): Int {
        dfs(root)
        return ans
    }

    private fun dfs(node: TreeNode?) {
        if (node == null) return
        dfs(node.left)
        prev?.let { p ->
            ans = minOf(ans, node.`val` - p)
        }
        prev = node.`val`
        dfs(node.right)
    }
}
