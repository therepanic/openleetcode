class Solution {
    fun subdomainVisits(cpdomains: Array<String>): List<String> {
        val freq = mutableMapOf<String, Int>()
        for (entry in cpdomains) {
            val (cntStr, dom) = entry.split(" ")
            val cnt = cntStr.toInt()
            val parts = dom.split(".")
            for (i in parts.indices) {
                val sub = parts.slice(i until parts.size).joinToString(".")
                freq[sub] = freq.getOrDefault(sub, 0) + cnt
            }
        }
        return freq.map { "${it.value} ${it.key}" }
    }
}
