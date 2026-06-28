class Solution {
    fun findDuplicate(paths: Array<String>): List<List<String>> {
        val map = mutableMapOf<String, MutableList<String>>()
        for (path in paths) {
            val parts = path.split(" ")
            val directory = parts[0]
            for (i in 1 until parts.size) {
                val file = parts[i]
                val parenIndex = file.indexOf('(')
                val name = file.substring(0, parenIndex)
                val content = file.substring(parenIndex + 1, file.length - 1)
                val fullPath = "$directory/$name"
                map.getOrPut(content) { mutableListOf() }.add(fullPath)
            }
        }
        return map.values.filter { it.size > 1 }
    }
}
