class Solution {
    fun isPathCrossing(path: String): Boolean {
        val set = HashSet<String>()
        var x = 0
        var y = 0
        set.add("0,0")
        for (c in path) {
            when (c) {
                'N' -> y++
                'S' -> y--
                'E' -> x++
                'W' -> x--
            }
            val point = "$x,$y"
            if (set.contains(point)) return true
            set.add(point)
        }
        return false
    }
}
