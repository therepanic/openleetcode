class Solution {
    fun simplifyPath(path: String): String {
        val parts = mutableListOf<String>()
        for (part in path.split("/")) {
            if (part.isEmpty() || part == ".") {
                continue
            }
            if (part == "..") {
                if (parts.isNotEmpty()) {
                    parts.removeAt(parts.size - 1)
                }
            } else {
                parts.add(part)
            }
        }

        return if (parts.isEmpty()) "/" else "/" + parts.joinToString("/")
    }
}
