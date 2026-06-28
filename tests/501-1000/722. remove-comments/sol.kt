class Solution {
    fun removeComments(source: Array<String>): List<String> {
        var inBlock = false
        val ans = mutableListOf<String>()
        var newline = StringBuilder()
        for (line in source) {
            var i = 0
            if (!inBlock) {
                newline = StringBuilder()
            }
            while (i < line.length) {
                if (i + 1 < line.length && line[i] == '/' && line[i + 1] == '*' && !inBlock) {
                    inBlock = true
                    i++
                } else if (i + 1 < line.length && line[i] == '*' && line[i + 1] == '/' && inBlock) {
                    inBlock = false
                    i++
                } else if (!inBlock && i + 1 < line.length && line[i] == '/' && line[i + 1] == '/') {
                    break
                } else if (!inBlock) {
                    newline.append(line[i])
                }
                i++
            }
            if (newline.isNotEmpty() && !inBlock) {
                ans.add(newline.toString())
            }
        }
        return ans
    }
}
