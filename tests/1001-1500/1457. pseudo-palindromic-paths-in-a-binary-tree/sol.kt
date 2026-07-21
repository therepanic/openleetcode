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
    private var count = 0
    private val counter = IntArray(10)

    fun pseudoPalindromicPaths (root: TreeNode?): Int {
        dfs(root)
        return count
    }

    private fun dfs(node: TreeNode?) {
        if (node == null) return

        counter[node.`val`]++

        if (node.left == null && node.right == null) {
            if (checkPalindromic()) count++
        } else {
            dfs(node.left)
            dfs(node.right)
        }

        counter[node.`val`]--
    }

    private fun checkPalindromic(): Boolean {
        var odd = 0
        for (i in 1..9) {
            if (counter[i] % 2 == 1) {
                odd++
                if (odd > 1) return false
            }
        }
        return true
    }
}
