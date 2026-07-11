class Solution {
    fun isRobotBounded(instructions: String): Boolean {
        val directions = arrayOf(intArrayOf(0,1), intArrayOf(1,0), intArrayOf(0,-1), intArrayOf(-1,0))
        var x = 0
        var y = 0
        var dirIndex = 0
        
        for (instr in instructions) {
            when (instr) {
                'G' -> {
                    x += directions[dirIndex][0]
                    y += directions[dirIndex][1]
                }
                'L' -> dirIndex = (dirIndex + 3) % 4
                'R' -> dirIndex = (dirIndex + 1) % 4
            }
        }
        
        return (x == 0 && y == 0) || dirIndex != 0
    }
}
