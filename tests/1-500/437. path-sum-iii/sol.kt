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
    fun pathSum(root: TreeNode?, targetSum: Int): Int {
        val prefixSums = mutableMapOf<Long, Int>()
        prefixSums[0L] = 1
        return dfs(root, 0L, targetSum, prefixSums)
    }
    
    private fun dfs(node: TreeNode?, currentSum: Long, targetSum: Int, prefixSums: MutableMap<Long, Int>): Int {
        if (node == null) return 0
        var sum = currentSum + node.`val`
        var count = prefixSums.getOrDefault(sum - targetSum, 0)
        prefixSums[sum] = prefixSums.getOrDefault(sum, 0) + 1
        count += dfs(node.left, sum, targetSum, prefixSums)
        count += dfs(node.right, sum, targetSum, prefixSums)
        prefixSums[sum] = prefixSums[sum]!! - 1
        return count
    }
}
