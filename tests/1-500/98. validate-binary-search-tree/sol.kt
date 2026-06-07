class Solution {
    fun isValidBST(root: TreeNode?): Boolean {
        return validate(root, null, null)
    }

    private fun validate(node: TreeNode?, lower: Long?, upper: Long?): Boolean {
        if (node == null) return true

        val value = node.`val`.toLong()
        if ((lower != null && value <= lower) || (upper != null && value >= upper)) return false

        return validate(node.left, lower, value) && validate(node.right, value, upper)
    }
}
