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
    fun getAllElements(root1: TreeNode?, root2: TreeNode?): List<Int> {
        val stack1 = ArrayDeque<TreeNode>()
        val stack2 = ArrayDeque<TreeNode>()
        val output = mutableListOf<Int>()
        var r1 = root1
        var r2 = root2
        
        while (r1 != null || r2 != null || stack1.isNotEmpty() || stack2.isNotEmpty()) {
            while (r1 != null) {
                stack1.addLast(r1)
                r1 = r1.left
            }
            while (r2 != null) {
                stack2.addLast(r2)
                r2 = r2.left
            }

            if (stack1.isNotEmpty() && stack2.isNotEmpty()) {
                if (stack1.last().`val` <= stack2.last().`val`) {
                    r1 = stack1.removeLast()
                    output.add(r1.`val`)
                    r1 = r1.right
                } else {
                    r2 = stack2.removeLast()
                    output.add(r2.`val`)
                    r2 = r2.right
                }
            } else if (stack1.isEmpty()) {
                r2 = stack2.removeLast()
                output.add(r2.`val`)
                r2 = r2.right
            } else {
                r1 = stack1.removeLast()
                output.add(r1.`val`)
                r1 = r1.right
            }
        }
        
        return output
    }
}
