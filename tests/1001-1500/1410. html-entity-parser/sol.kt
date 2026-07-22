class Solution {
    fun entityParser(text: String): String {
        val entities = mapOf(
            "&quot" to "\"",
            "&apos" to "'",
            "&amp" to "&",
            "&gt" to ">",
            "&lt" to "<",
            "&frasl" to "/"
        )
        
        val pattern = Regex("&[^;&\\s]+;")
        
        return pattern.replace(text) { matchResult ->
            val match = matchResult.value
            val entity = match.dropLast(1)
            entities.getOrDefault(entity, match)
        }
    }
}
