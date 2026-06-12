class Solution {
    fun postorderTraversal(root: TreeNode?): List<Int> {
        val result = mutableListOf<Int>()
        if (root == null) return result

        val stack = mutableListOf(root)
        while (stack.isNotEmpty()) {
            val node = stack.removeAt(stack.lastIndex)
            result.add(node.`val`)
            node.left?.let { stack.add(it) }
            node.right?.let { stack.add(it) }
        }
        result.reverse()
        return result
    }
}
