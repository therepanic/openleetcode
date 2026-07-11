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
import java.util.LinkedList

class Solution {
    fun smallestFromLeaf(root: TreeNode?): String {
        var smallestString = ""
        val nodeQueue = LinkedList<Pair<TreeNode?, String>>()
        
        nodeQueue.add(Pair(root, ('a' + root!!.`val`).toString()))
        
        while (nodeQueue.isNotEmpty()) {
            val (node, currentString) = nodeQueue.poll()
            
            if (node!!.left == null && node.right == null) {
                if (smallestString.isEmpty() || currentString < smallestString) {
                    smallestString = currentString
                }
            }
            
            if (node.left != null) {
                nodeQueue.add(Pair(node.left, ('a' + node.left!!.`val`) + currentString))
            }
            
            if (node.right != null) {
                nodeQueue.add(Pair(node.right, ('a' + node.right!!.`val`) + currentString))
            }
        }
        
        return smallestString
    }
}
