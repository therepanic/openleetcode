class Solution {
    fun kSmallestPairs(nums1: IntArray, nums2: IntArray, k: Int): List<List<Int>> {
        val result = mutableListOf<List<Int>>()
        if (nums1.isEmpty() || nums2.isEmpty()) {
            return result
        }

        val pq = java.util.PriorityQueue<IntArray> { a, b ->
            val cmp = a[0].compareTo(b[0])
            if (cmp != 0) cmp else {
                val cmp2 = a[1].compareTo(b[1])
                if (cmp2 != 0) cmp2 else a[2].compareTo(b[2])
            }
        }
        val visited = HashSet<String>()

        pq.offer(intArrayOf(nums1[0] + nums2[0], 0, 0))
        visited.add("0,0")

        while (pq.isNotEmpty() && result.size < k) {
            val cur = pq.poll()
            val i = cur[1]
            val j = cur[2]
            result.add(listOf(nums1[i], nums2[j]))

            if (j + 1 < nums2.size && visited.add("$i,${j + 1}")) {
                pq.offer(intArrayOf(nums1[i] + nums2[j + 1], i, j + 1))
            }

            if (i + 1 < nums1.size && visited.add("${i + 1},$j")) {
                pq.offer(intArrayOf(nums1[i + 1] + nums2[j], i + 1, j))
            }
        }

        return result
    }
}
