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
    fun sumRootToLeaf(root: TreeNode?): Int {
        fun dfs(node: TreeNode?, current: Int): Int {
            if (node == null) {
                return 0
            }
            
            val newCurrent = current * 2 + node.`val`
            
            if (node.left == null && node.right == null) {
                return newCurrent
            }
            
            return dfs(node.left, newCurrent) + dfs(node.right, newCurrent)
        }
        
        return dfs(root, 0)
    }
}
