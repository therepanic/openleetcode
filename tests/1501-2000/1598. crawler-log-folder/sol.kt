class Solution {
    fun minOperations(logs: Array<String>): Int {
        var output = 0
        for (log in logs) {
            if (log == "../") {
                output--
                if (output < 0) output = 0
            } else if (log == "./") {
                continue
            } else {
                output++
            }
        }
        return if (output < 0) 0 else output
    }
}
