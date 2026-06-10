
class Solution {
    fun buildTree(inorder: IntArray, postorder: IntArray): TreeNode? {
        val index = HashMap<Int, Int>()
        for (i in inorder.indices) index[inorder[i]] = i
        var postIndex = postorder.size - 1

        fun build(left: Int, right: Int): TreeNode? {
            if (left > right) return null
            val rootVal = postorder[postIndex--]
            val root = TreeNode(rootVal)
            val mid = index[rootVal]!!
            root.right = build(mid + 1, right)
            root.left = build(left, mid - 1)
            return root
        }

        return build(0, inorder.size - 1)
    }
}
