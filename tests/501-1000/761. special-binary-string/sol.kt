class Solution {
    fun makeLargestSpecial(s: String): String {
        var count = 0
        var i = 0
        val res = mutableListOf<String>()
        
        for (j in s.indices) {
            count += if (s[j] == '1') 1 else -1
            
            if (count == 0) {
                res.add("1" + makeLargestSpecial(s.substring(i + 1, j)) + "0")
                i = j + 1
            }
        }
        
        res.sortDescending()
        return res.joinToString("")
    }
}
