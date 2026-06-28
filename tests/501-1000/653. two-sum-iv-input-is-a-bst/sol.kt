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
    fun findTarget(root: TreeNode?, k: Int): Boolean {
        val seen = mutableSetOf<Int>()
        
        fun dfs(node: TreeNode?): Boolean {
            if (node == null) return false
            if (seen.contains(k - node.`val`)) return true
            seen.add(node.`val`)
            return dfs(node.left) || dfs(node.right)
        }
        
        return dfs(root)
    }
}
