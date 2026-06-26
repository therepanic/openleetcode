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
    fun findFrequentTreeSum(root: TreeNode?): IntArray {
        val c = mutableMapOf<Int, Int>()
        var max = 0
        fun s(n: TreeNode?): Int {
            if (n == null) return 0
            val r = n.`val` + s(n.left) + s(n.right)
            c[r] = c.getOrDefault(r, 0) + 1
            if (c[r]!! > max) max = c[r]!!
            return r
        }
        s(root)
        val res = mutableListOf<Int>()
        for ((k, v) in c) {
            if (v == max) res.add(k)
        }
        return res.toIntArray()
    }
}
