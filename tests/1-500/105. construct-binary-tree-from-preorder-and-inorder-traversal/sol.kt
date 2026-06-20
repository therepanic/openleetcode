
class Solution {
    private lateinit var preorderValues: IntArray
    private lateinit var inorderIndex: HashMap<Int, Int>
    private var preorderIndex = 0

    fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
        preorderValues = preorder
        inorderIndex = HashMap()
        for (i in inorder.indices) inorderIndex[inorder[i]] = i
        preorderIndex = 0
        return build(0, inorder.size - 1)
    }

    private fun build(left: Int, right: Int): TreeNode? {
        if (left > right) return null
        val rootVal = preorderValues[preorderIndex++]
        val root = TreeNode(rootVal)
        val mid = inorderIndex[rootVal]!!
        root.left = build(left, mid - 1)
        root.right = build(mid + 1, right)
        return root
    }
}
