class Solution {
    fun reformatNumber(number: String): String {
        var phoneCleared = number.filter { it.isDigit() }
        val result = mutableListOf<String>()
        
        while (phoneCleared.length > 4) {
            result.add(phoneCleared.substring(0, 3))
            phoneCleared = phoneCleared.substring(3)
        }
        
        if (phoneCleared.length == 4) {
            result.add(phoneCleared.substring(0, 2))
            result.add(phoneCleared.substring(2))
        } else if (phoneCleared.isNotEmpty()) {
            result.add(phoneCleared)
        }
        
        return result.joinToString("-")
    }
}
