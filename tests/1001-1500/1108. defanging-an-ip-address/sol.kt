class Solution {
    fun defangIPaddr(address: String): String {
        val s = StringBuilder()
        for (i in address) {
            if (i == '.') {
                s.append("[.]")
            } else {
                s.append(i)
            }
        }
        return s.toString()
    }
}
