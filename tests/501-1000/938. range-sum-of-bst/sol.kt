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
    fun rangeSumBST(root: TreeNode?, low: Int, high: Int): Int {
        val res = intArrayOf(0)
        fun dfs(node: TreeNode?) {
            if (node == null) return
            dfs(node.left)
            if (node.`val` in low..high) {
                res[0] += node.`val`
            }
            dfs(node.right)
        }
        dfs(root)
        return res[0]
    }
}
