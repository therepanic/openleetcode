class Solution {
    fun alertNames(keyName: Array<String>, keyTime: Array<String>): List<String> {
        val map = mutableMapOf<String, MutableList<Int>>()
        
        for (i in keyName.indices) {
            val parts = keyTime[i].split(":")
            val minutes = parts[0].toInt() * 60 + parts[1].toInt()
            map.getOrPut(keyName[i]) { mutableListOf() }.add(minutes)
        }
        
        val result = mutableListOf<String>()
        
        for ((name, times) in map) {
            times.sort()
            for (i in 0 until times.size - 2) {
                if (times[i+2] - times[i] <= 60) {
                    result.add(name)
                    break
                }
            }
        }
        
        return result.sorted()
    }
}
