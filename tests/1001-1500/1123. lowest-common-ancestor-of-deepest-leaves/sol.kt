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
    fun lcaDeepestLeaves(root: TreeNode?): TreeNode? {
        return dfs(root, 0).first
    }
    
    private fun dfs(node: TreeNode?, depth: Int): Pair<TreeNode?, Int> {
        if (node == null) {
            return Pair(null, depth)
        }
        
        val left = dfs(node.left, depth + 1)
        val right = dfs(node.right, depth + 1)
        
        return if (left.second > right.second) {
            Pair(left.first, left.second)
        } else if (right.second > left.second) {
            Pair(right.first, right.second)
        } else {
            Pair(node, left.second)
        }
    }
}
