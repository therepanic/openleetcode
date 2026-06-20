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
    fun deleteNode(root: TreeNode?, key: Int): TreeNode? {
        if (root == null) {
            return null
        }
        if (root.`val` == key) {
            return helper(root)
        }
        
        var dummy = root
        var curr = root
        while (curr != null) {
            if (curr.`val` > key) {
                if (curr.left != null && curr.left!!.`val` == key) {
                    curr.left = helper(curr.left)
                    break
                } else {
                    curr = curr.left
                }
            } else {
                if (curr.right != null && curr.right!!.`val` == key) {
                    curr.right = helper(curr.right)
                    break
                } else {
                    curr = curr.right
                }
            }
        }
        return dummy
    }
    
    private fun helper(root: TreeNode?): TreeNode? {
        if (root == null) return null
        if (root.left == null) {
            return root.right
        }
        if (root.right == null) {
            return root.left
        }
        
        val rightChild = root.right
        val lastRight = flr(root.left)
        lastRight?.right = rightChild
        return root.left
    }
    
    private fun flr(root: TreeNode?): TreeNode? {
        if (root?.right == null) {
            return root
        }
        return flr(root.right)
    }
}
