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
    fun bstFromPreorder(preorder: IntArray): TreeNode? {
        if (preorder.isEmpty()) {
            return null
        }
        return build(preorder, 0, preorder.size - 1)
    }
    
    private fun build(preorder: IntArray, start: Int, end: Int): TreeNode? {
        if (start > end) {
            return null
        }
        val root = TreeNode(preorder[start])
        var i = start + 1
        while (i <= end && preorder[i] < root.`val`) {
            i++
        }
        root.left = build(preorder, start + 1, i - 1)
        root.right = build(preorder, i, end)
        return root
    }
}
