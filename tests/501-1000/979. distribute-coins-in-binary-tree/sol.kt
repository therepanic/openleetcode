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
    private var moves: Int = 0
    
    fun distributeCoins(root: TreeNode?): Int {
        solve(root)
        return moves
    }
    
    private fun solve(node: TreeNode?): Int {
        if (node == null) return 0
        val leftCandie = solve(node.left)
        val rightCandie = solve(node.right)
        moves += Math.abs(leftCandie) + Math.abs(rightCandie)
        return (leftCandie + rightCandie + node.`val`) - 1
    }
}
