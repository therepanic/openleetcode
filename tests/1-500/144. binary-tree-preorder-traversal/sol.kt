class Solution {
    fun preorderTraversal(root: TreeNode?): List<Int> {
        val result = mutableListOf<Int>()
        if (root == null) return result

        val stack = mutableListOf(root)
        while (stack.isNotEmpty()) {
            val node = stack.removeAt(stack.lastIndex)
            result.add(node.`val`)
            node.right?.let { stack.add(it) }
            node.left?.let { stack.add(it) }
        }
        return result
    }
}
