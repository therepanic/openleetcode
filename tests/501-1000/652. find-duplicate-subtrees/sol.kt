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
    private val seen = mutableMapOf<String, Int>()
    private val ans = mutableListOf<TreeNode?>()
    
    fun findDuplicateSubtrees(root: TreeNode?): List<TreeNode?> {
        solve(root)
        return ans
    }
    
    private fun solve(node: TreeNode?): String {
        if (node == null) {
            return "#"
        }
        val left = solve(node.left)
        val right = solve(node.right)
        val currTree = "${node.`val`}, $left, $right"
        seen[currTree] = seen.getOrDefault(currTree, 0) + 1
        if (seen[currTree] == 2) {
            ans.add(node)
        }
        return currTree
    }
}
