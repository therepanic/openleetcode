class Solution {
    fun validateBinaryTreeNodes(n: Int, leftChild: IntArray, rightChild: IntArray): Boolean {
        val inDegree = IntArray(n)
        for (i in 0 until n) {
            for (child in intArrayOf(leftChild[i], rightChild[i])) {
                if (child != -1) {
                    if (child < 0 || child >= n) return false
                    inDegree[child]++
                    if (inDegree[child] > 1) return false
                }
            }
        }

        var root = -1
        for (i in 0 until n) {
            if (inDegree[i] == 0) {
                if (root != -1) return false
                root = i
            }
        }
        if (root == -1) return false

        val queue: java.util.Queue<Int> = java.util.LinkedList()
        val visited = BooleanArray(n)
        queue.offer(root)
        visited[root] = true
        var count = 1

        while (queue.isNotEmpty()) {
            val node = queue.poll()
            for (child in intArrayOf(leftChild[node], rightChild[node])) {
                if (child == -1) continue
                if (visited[child]) return false
                visited[child] = true
                count++
                queue.offer(child)
            }
        }
        return count == n
    }
}
