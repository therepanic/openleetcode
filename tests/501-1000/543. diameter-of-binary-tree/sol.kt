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
    fun diameterOfBinaryTree(root: TreeNode?): Int {
        fun height(node: TreeNode?): Int {
            if (node == null) return 0
            return 1 + maxOf(height(node.left), height(node.right))
        }
        
        fun diameter(node: TreeNode?): Int {
            if (node == null) return 0
            val diameterThroughNode = height(node.left) + height(node.right)
            val leftDiameter = diameter(node.left)
            val rightDiameter = diameter(node.right)
            return maxOf(diameterThroughNode, maxOf(leftDiameter, rightDiameter))
        }
        
        return diameter(root)
    }
}
