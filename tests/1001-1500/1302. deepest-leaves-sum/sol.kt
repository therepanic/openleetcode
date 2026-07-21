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
    fun deepestLeavesSum(root: TreeNode?): Int {
        val depthMap = mutableMapOf<Int, Int>()
        
        fun dfs(node: TreeNode?, depth: Int) {
            if (node == null) return
            if (node.left == null && node.right == null) {
                depthMap[depth] = depthMap.getOrDefault(depth, 0) + node.`val`
            }
            dfs(node.left, depth + 1)
            dfs(node.right, depth + 1)
        }
        
        dfs(root, 0)
        val maxDepth = depthMap.keys.maxOrNull() ?: 0
        return depthMap[maxDepth] ?: 0
    }
}
