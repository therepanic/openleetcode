class Solution {
    fun interpret(command: String): String {
        val result = StringBuilder()
        var i = 0
        while (i < command.length) {
            if (command[i] == 'G') {
                result.append("G")
                i++
            } else if (command.startsWith("()", i)) {
                result.append("o")
                i += 2
            } else {
                result.append("al")
                i += 4
            }
        }
        return result.toString()
    }
}
