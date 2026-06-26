class Solution {
    fun isValid(code: String): Boolean {
        val tagPat = Regex("<(/?)([A-Z]{1,9})>")
        val openCdata = "<![CDATA["
        val closeCdata = "]]>"
        val stack = ArrayDeque<String>()
        var firstTagSeen = false
        var i = 0
        val j = code.length
        
        while (i <= j) {
            val s = code.indexOf('<', i)
            if (s == -1) break
            val e = code.indexOf('>', s + 1)
            if (e == -1) return false
            
            val candidate = code.substring(s, e + 1)
            val m = tagPat.matchEntire(candidate)
            
            if (m != null) {
                val tag = m.groupValues[2]
                
                if (m.groupValues[1].isEmpty()) {
                    if (!firstTagSeen && s != 0) return false
                    stack.addLast(tag)
                    firstTagSeen = true
                } else {
                    if (stack.isEmpty() || stack.last() != tag) return false
                    if (stack.size == 1 && e != code.length - 1) return false
                    stack.removeLast()
                }
                
                i = e + 1
            } else if (code.startsWith(openCdata, s)) {
                val k = code.indexOf(closeCdata, s + openCdata.length)
                if (k == -1) return false
                i = k + closeCdata.length
            } else {
                return false
            }
        }
        
        return stack.isEmpty() && firstTagSeen
    }
}
