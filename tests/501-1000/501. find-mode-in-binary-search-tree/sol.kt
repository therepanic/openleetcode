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
    fun findMode(root: TreeNode?): IntArray {
        val lst = mutableListOf<Int>()
        fun traverse(curr: TreeNode?) {
            if (curr != null) {
                lst.add(curr.`val`)
                traverse(curr.left)
                traverse(curr.right)
            }
        }
        traverse(root)
        val d = mutableMapOf<Int, Int>()
        for (v in lst) {
            d[v] = d.getOrDefault(v, 0) + 1
        }
        var m = 0
        for (v in lst) {
            m = maxOf(m, d[v]!!)
        }
        val sol = mutableSetOf<Int>()
        for (v in lst) {
            if (d[v] == m) {
                sol.add(v)
            }
        }
        return sol.toIntArray()
    }
}
