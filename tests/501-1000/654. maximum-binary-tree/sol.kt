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
    fun constructMaximumBinaryTree(nums: IntArray): TreeNode? {
        val stack = ArrayDeque<TreeNode>()
        
        for (num in nums) {
            val current = TreeNode(num)
            
            while (stack.isNotEmpty() && stack.last().`val` < num) {
                current.left = stack.removeLast()
            }
            
            if (stack.isNotEmpty()) {
                stack.last().right = current
            }
            
            stack.addLast(current)
        }
        
        return stack.first()
    }
}
