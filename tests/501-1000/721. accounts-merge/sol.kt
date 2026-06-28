class Solution {
    fun accountsMerge(accounts: Array<Array<String>>): List<List<String>> {
        val parent = mutableMapOf<String, String>()
        val owner = mutableMapOf<String, String>()

        fun find(x: String): String {
            val p = parent[x]!!
            if (p != x) {
                parent[x] = find(p)
            }
            return parent[x]!!
        }

        fun union(a: String, b: String) {
            val ra = find(a)
            val rb = find(b)
            if (ra != rb) {
                parent[rb] = ra
            }
        }

        for (account in accounts) {
            val name = account[0]
            val first = account[1]
            parent.putIfAbsent(first, first)
            owner[first] = name
            for (i in 1 until account.size) {
                val email = account[i]
                parent.putIfAbsent(email, email)
                owner[email] = name
                union(first, email)
            }
        }

        val groups = mutableMapOf<String, MutableList<String>>()
        for (email in owner.keys) {
            val root = find(email)
            groups.getOrPut(root) { mutableListOf() }.add(email)
        }

        val result = mutableListOf<List<String>>()
        for ((root, emails) in groups) {
            emails.sort()
            result.add(listOf(owner[root]!!) + emails)
        }
        return result
    }
}
