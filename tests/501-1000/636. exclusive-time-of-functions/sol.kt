class Solution {
    fun exclusiveTime(n: Int, logs: Array<String>): IntArray {
        val callstack = ArrayDeque<IntArray>()
        val exectime = IntArray(n)
        
        for (log in logs) {
            val parts = log.split(":")
            val idn = parts[0].toInt()
            val status = parts[1]
            val curtime = parts[2].toInt()
            
            if (status == "start") {
                callstack.addLast(intArrayOf(idn, curtime))
            } else {
                val top = callstack.removeLast()
                val x = top[0]
                val y = top[1]
                val time = curtime - y + 1
                exectime[x] += time
                if (callstack.isNotEmpty()) {
                    val prev = callstack.last()[0]
                    exectime[prev] -= time
                }
            }
        }
        
        return exectime
    }
}
