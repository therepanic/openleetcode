class Solution {
    fun suggestedProducts(products: Array<String>, searchWord: String): List<List<String>> {
        products.sort()
        val answer = mutableListOf<List<String>>()
        var prefix = ""
        for (ch in searchWord) {
            prefix += ch
            answer.add(products.asSequence().filter { it.startsWith(prefix) }.take(3).toList())
        }
        return answer
    }
}
