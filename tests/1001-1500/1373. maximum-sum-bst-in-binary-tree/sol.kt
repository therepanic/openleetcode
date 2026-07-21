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
    private var best = 0
    
    fun maxSumBST(root: TreeNode?): Int {
        best = 0
        dfs(root)
        return best
    }
    
    private fun dfs(node: TreeNode?): IntArray {
        if (node == null) {
            return intArrayOf(1, Int.MAX_VALUE, Int.MIN_VALUE, 0)
        }
        
        val left = dfs(node.left)
        val right = dfs(node.right)
        
        val lbst = left[0]
        val lmin = left[1]
        val lmax = left[2]
        val lsum = left[3]
        val rbst = right[0]
        val rmin = right[1]
        val rmax = right[2]
        val rsum = right[3]
        
        if (lbst == 1 && rbst == 1 && lmax < node.`val` && node.`val` < rmin) {
            val total = lsum + rsum + node.`val`
            best = maxOf(best, total)
            val newMin = minOf(lmin, node.`val`)
            val newMax = maxOf(rmax, node.`val`)
            return intArrayOf(1, newMin, newMax, total)
        }
        
        return intArrayOf(0, Int.MIN_VALUE, Int.MAX_VALUE, 0)
    }
}
