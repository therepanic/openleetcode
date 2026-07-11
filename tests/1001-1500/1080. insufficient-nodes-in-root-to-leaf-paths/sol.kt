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
    fun sufficientSubset(root: TreeNode?, limit: Int): TreeNode? {
        fun dfs(node: TreeNode?, pathSum: Int): Boolean {
            if (node == null) {
                return false
            }
            
            val curr = pathSum + node.`val`
            
            if (node.left == null && node.right == null) {
                return curr >= limit
            }
            
            val leftGood = dfs(node.left, curr)
            val rightGood = dfs(node.right, curr)
            
            if (!leftGood) {
                node.left = null
            }
            if (!rightGood) {
                node.right = null
            }
            
            return leftGood || rightGood
        }
        
        return if (dfs(root, 0)) root else null
    }
}
