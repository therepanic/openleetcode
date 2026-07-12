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
    fun constructFromPrePost(preorder: IntArray, postorder: IntArray): TreeNode? {
        val index = intArrayOf(0)
        return construct(preorder, postorder, index, 0, preorder.size - 1)
    }
    
    private fun construct(pre: IntArray, post: IntArray, index: IntArray, l: Int, h: Int): TreeNode? {
        if (index[0] >= pre.size || l > h) {
            return null
        }
        
        val root = TreeNode(pre[index[0]])
        index[0]++
        if (l == h) {
            return root
        }
        
        var i = l
        while (i <= h && post[i] != pre[index[0]]) {
            i++
        }
        
        if (i <= h) {
            root.left = construct(pre, post, index, l, i)
            root.right = construct(pre, post, index, i + 1, h - 1)
        }
        
        return root
    }
}
