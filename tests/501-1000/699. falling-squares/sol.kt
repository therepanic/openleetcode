class Solution {
    private lateinit var tree: IntArray
    private lateinit var lazy: IntArray
    private var n = 0

    private fun buildTree(node: Int, start: Int, end: Int, arr: IntArray) {
        if (start == end) {
            tree[node] = arr[start]
            return
        }
        val mid = (start + end) / 2
        buildTree(node * 2 + 1, start, mid, arr)
        buildTree(node * 2 + 2, mid + 1, end, arr)
        tree[node] = maxOf(tree[node * 2 + 1], tree[node * 2 + 2])
    }

    private fun updateHelper(node: Int, start: Int, end: Int, left: Int, right: Int, value: Int) {
        if (lazy[node] != 0) {
            tree[node] = maxOf(tree[node], lazy[node])
            if (start != end) {
                lazy[node * 2 + 1] = lazy[node]
                lazy[node * 2 + 2] = lazy[node]
            }
            lazy[node] = 0
        }

        if (start > right || end < left || start > end) {
            return
        }

        if (start >= left && end <= right) {
            tree[node] = value
            if (start != end) {
                lazy[node * 2 + 1] = value
                lazy[node * 2 + 2] = value
            }
            return
        }

        val mid = (start + end) / 2
        updateHelper(node * 2 + 1, start, mid, left, right, value)
        updateHelper(node * 2 + 2, mid + 1, end, left, right, value)
        tree[node] = maxOf(tree[node * 2 + 1], tree[node * 2 + 2])
    }

    private fun queryHelper(node: Int, start: Int, end: Int, left: Int, right: Int): Int {
        if (lazy[node] != 0) {
            tree[node] = maxOf(tree[node], lazy[node])
            if (start != end) {
                lazy[node * 2 + 1] = lazy[node]
                lazy[node * 2 + 2] = lazy[node]
            }
            lazy[node] = 0
        }

        if (start >= left && end <= right) {
            return tree[node]
        }

        if (start > right || end < left) {
            return 0
        }

        val mid = (start + end) / 2
        return maxOf(
            queryHelper(node * 2 + 1, start, mid, left, right),
            queryHelper(node * 2 + 2, mid + 1, end, left, right)
        )
    }

    private fun updateRange(left: Int, right: Int, value: Int) {
        updateHelper(0, 0, n - 1, left, right, value)
    }

    private fun query(left: Int, right: Int): Int {
        return queryHelper(0, 0, n - 1, left, right)
    }

    fun fallingSquares(positions: Array<IntArray>): List<Int> {
        val ans = mutableListOf<Int>()
        val posSet = mutableSetOf<Int>()
        for (p in positions) {
            val l = p[0]
            val side = p[1]
            posSet.add(l)
            posSet.add(l + side - 1)
        }
        val posList = posSet.toList().sorted()
        val mp = mutableMapOf<Int, Int>()
        for ((i, v) in posList.withIndex()) {
            mp[v] = i
        }
        n = posList.size
        val arr = IntArray(n) { 0 }
        tree = IntArray(4 * n) { 0 }
        lazy = IntArray(4 * n) { 0 }
        if (n > 0) {
            buildTree(0, 0, n - 1, arr)
        }
        for (p in positions) {
            val l = p[0]
            val side = p[1]
            val left = mp[l]!!
            val right = mp[l + side - 1]!!
            val mx = query(left, right)
            updateRange(left, right, mx + side)
            ans.add(query(0, n - 1))
        }
        return ans
    }
}
