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
    fun leafSimilar(root1: TreeNode?, root2: TreeNode?): Boolean {
        fun helper(root: TreeNode?, leaves: MutableList<Int>): MutableList<Int> {
            if (root == null) {
                return leaves
            }
            val stack = ArrayDeque<TreeNode>()
            stack.addLast(root)
            while (stack.isNotEmpty()) {
                val curr = stack.removeLast()
                if (curr.left == null && curr.right == null) {
                    leaves.add(curr.`val`)
                }
                if (curr.right != null) {
                    stack.addLast(curr.right!!)
                }
                if (curr.left != null) {
                    stack.addLast(curr.left!!)
                }
            }
            return leaves
        }
        return helper(root1, mutableListOf()) == helper(root2, mutableListOf())
    }
}
