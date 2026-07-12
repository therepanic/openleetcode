import java.util.*

class Solution {
    fun delNodes(root: TreeNode?, to_delete: IntArray): List<TreeNode?> {
        val ans = mutableListOf<TreeNode>()
        if (root == null) return ans

        val st = to_delete.toHashSet()
        val ref = TreeNode(-1)
        ref.left = root

        val q1: Deque<TreeNode> = ArrayDeque()
        val toProcess: Deque<TreeNode> = ArrayDeque()
        toProcess.add(ref)

        while (toProcess.isNotEmpty()) {
            val newTree = toProcess.poll()

            if (newTree.left != null) {
                if (st.contains(newTree.left!!.`val`)) {
                    toProcess.add(newTree.left)
                } else {
                    ans.add(newTree.left!!)
                    q1.add(newTree.left)
                }
                newTree.left = null
            }

            if (newTree.right != null) {
                if (st.contains(newTree.right!!.`val`)) {
                    toProcess.add(newTree.right)
                } else {
                    ans.add(newTree.right!!)
                    q1.add(newTree.right)
                }
                newTree.right = null
            }

            while (q1.isNotEmpty()) {
                val temp = q1.poll()

                if (temp.left != null) {
                    if (st.contains(temp.left!!.`val`)) {
                        toProcess.add(temp.left)
                        temp.left = null
                    } else {
                        q1.add(temp.left)
                    }
                }

                if (temp.right != null) {
                    if (st.contains(temp.right!!.`val`)) {
                        toProcess.add(temp.right)
                        temp.right = null
                    } else {
                        q1.add(temp.right)
                    }
                }
            }
        }

        return ans
    }
}
