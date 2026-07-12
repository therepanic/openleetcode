class Solution {
    fun robotSim(commands: IntArray, obstacles: Array<IntArray>): Int {
        val blocked = mutableSetOf<String>()
        for (o in obstacles) {
            blocked.add("${o[0]},${o[1]}")
        }

        val directions = arrayOf(
            intArrayOf(0, 1), intArrayOf(1, 0), intArrayOf(0, -1), intArrayOf(-1, 0)
        )

        var x = 0
        var y = 0
        var dir = 0
        var maxDist = 0

        for (cmd in commands) {
            when (cmd) {
                -1 -> dir = (dir + 1) % 4
                -2 -> dir = (dir + 3) % 4
                else -> {
                    var steps = cmd
                    while (steps > 0) {
                        val nx = x + directions[dir][0]
                        val ny = y + directions[dir][1]

                        if ("$nx,$ny" in blocked) {
                            break
                        }

                        x = nx
                        y = ny

                        maxDist = maxOf(maxDist, x * x + y * y)
                        steps--
                    }
                }
            }
        }

        return maxDist
    }
}
