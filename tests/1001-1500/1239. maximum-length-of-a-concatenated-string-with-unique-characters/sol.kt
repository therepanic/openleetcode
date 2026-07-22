class Solution {
    private var ans = 0

    fun maxLength(arr: Array<String>): Int {
        ans = 0
        dfs(0, "", arr)
        return ans
    }

    private fun dfs(i: Int, path: String, arr: Array<String>) {
        ans = maxOf(ans, path.length)
        for (j in i until arr.size) {
            val s = arr[j]
            if (s.toSet().size != s.length || path.toSet().intersect(s.toSet()).isNotEmpty()) continue
            dfs(j + 1, path + s, arr)
        }
    }
}
