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
    fun findSecondMinimumValue(root: TreeNode?): Int {
        val first = root!!.`val`
        var second = Long.MAX_VALUE
        
        fun dfs(node: TreeNode?) {
            if (node == null) return
            if (first < node.`val` && node.`val`.toLong() < second) {
                second = node.`val`.toLong()
            }
            dfs(node.left)
            dfs(node.right)
        }
        
        dfs(root)
        return if (second == Long.MAX_VALUE) -1 else second.toInt()
    }
}
