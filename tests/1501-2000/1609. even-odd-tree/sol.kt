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
    fun isEvenOddTree(root: TreeNode?): Boolean {
        val elements = mutableListOf<MutableList<Int>>(mutableListOf())
        fun collect(temp: TreeNode?, pos: Int): Boolean {
            if (temp == null) return true
            if (elements.size == pos) elements.add(mutableListOf())
            val posCheck = pos % 2
            val valCheck = temp.`val` % 2
            if (posCheck == 0 && valCheck != 0) {
                if (elements[pos].isNotEmpty() && !(elements[pos].last() < temp.`val`)) return false
                elements[pos].add(temp.`val`)
            } else if (posCheck != 0 && valCheck == 0) {
                if (elements[pos].isNotEmpty() && !(elements[pos].last() > temp.`val`)) return false
                elements[pos].add(temp.`val`)
            } else {
                return false
            }
            return collect(temp.left, pos + 1) && collect(temp.right, pos + 1)
        }
        return collect(root, 0)
    }
}
