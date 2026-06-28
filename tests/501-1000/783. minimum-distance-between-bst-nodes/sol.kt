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
    private var prev: Int? = null
    private var minDiff = Int.MAX_VALUE
    
    fun minDiffInBST(root: TreeNode?): Int {
        inorder(root)
        return minDiff
    }
    
    private fun inorder(root: TreeNode?) {
        if (root == null) return
        inorder(root.left)
        if (prev != null) {
            val diff = root.`val` - prev!!
            if (diff < minDiff) {
                minDiff = diff
            }
        }
        prev = root.`val`
        inorder(root.right)
    }
}
