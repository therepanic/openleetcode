class Solution {
    fun inorderTraversal(root: TreeNode?): List<Int> {
        val result = mutableListOf<Int>()
        traverse(root, result)
        return result
    }

    private fun traverse(node: TreeNode?, result: MutableList<Int>) {
        if (node == null) return
        traverse(node.left, result)
        result.add(node.`val`)
        traverse(node.right, result)
    }
}
