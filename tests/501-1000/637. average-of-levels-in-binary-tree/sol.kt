class Solution {
    fun averageOfLevels(root: TreeNode?): DoubleArray {
        if (root == null) return DoubleArray(0)

        val res = mutableListOf<Double>()
        val queue: java.util.Queue<TreeNode> = java.util.LinkedList()
        queue.offer(root)

        while (queue.isNotEmpty()) {
            var levelSum = 0.0
            val count = queue.size

            for (i in 0 until count) {
                val node = queue.poll()
                levelSum += node.`val`
                node.left?.let { queue.offer(it) }
                node.right?.let { queue.offer(it) }
            }

            res.add(levelSum / count)
        }

        return res.toDoubleArray()
    }
}
