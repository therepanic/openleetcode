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
    private var ans = 0
    
    private fun solve(node: TreeNode?): Int {
        if (node == null) return 0
        val left = solve(node.left)
        val right = solve(node.right)
        var leftPath = 0
        var rightPath = 0
        val leftNode = node.left
        val rightNode = node.right
        if (leftNode != null && leftNode.`val` == node.`val`) {
            leftPath = left + 1
        }
        if (rightNode != null && rightNode.`val` == node.`val`) {
            rightPath = right + 1
        }
        ans = maxOf(ans, leftPath + rightPath)
        return maxOf(leftPath, rightPath)
    }
    
    fun longestUnivaluePath(root: TreeNode?): Int {
        ans = 0
        solve(root)
        return ans
    }
}
