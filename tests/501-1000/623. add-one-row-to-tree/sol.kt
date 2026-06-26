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
    fun addOneRow(root: TreeNode?, `val`: Int, depth: Int): TreeNode? {
        if (depth == 1) {
            val newRoot = TreeNode(`val`)
            newRoot.left = root
            return newRoot
        }
        construct(root, `val`, depth, 1)
        return root
    }
    
    private fun construct(temp: TreeNode?, `val`: Int, depth: Int, count: Int) {
        if (temp == null) {
            return
        }
        if (count == depth - 1) {
            val newLeft = TreeNode(`val`)
            newLeft.left = temp.left
            temp.left = newLeft
            
            val newRight = TreeNode(`val`)
            newRight.right = temp.right
            temp.right = newRight
            return
        }
        construct(temp.left, `val`, depth, count + 1)
        construct(temp.right, `val`, depth, count + 1)
    }
}
