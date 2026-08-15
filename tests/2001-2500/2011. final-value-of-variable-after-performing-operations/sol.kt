class Solution {
    fun finalValueAfterOperations(operations: Array<String>): Int {
        var result = 0
        for (operation in operations) result += if (operation[1] == '+') 1 else -1
        return result
    }
}
