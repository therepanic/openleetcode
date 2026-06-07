class Solution {
    fun fullJustify(words: Array<String>, maxWidth: Int): List<String> {
        val res = mutableListOf<String>()
        var i = 0

        while (i < words.size) {
            var j = i
            var lineLen = 0
            while (j < words.size && lineLen + words[j].length + (j - i) <= maxWidth) {
                lineLen += words[j].length
                j++
            }

            val spaces = maxWidth - lineLen
            val gaps = j - i - 1
            val line = StringBuilder()

            if (j == words.size || gaps == 0) {
                for (k in i until j) {
                    if (k > i) {
                        line.append(' ')
                    }
                    line.append(words[k])
                }
                while (line.length < maxWidth) {
                    line.append(' ')
                }
            } else {
                val each = spaces / gaps
                var extra = spaces % gaps
                for (k in i until j) {
                    line.append(words[k])
                    if (k < j - 1) {
                        val count = each + if (extra > 0) 1 else 0
                        repeat(count) {
                            line.append(' ')
                        }
                        if (extra > 0) {
                            extra--
                        }
                    }
                }
            }

            res.add(line.toString())
            i = j
        }

        return res
    }
}
