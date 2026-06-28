class Solution {
    fun containVirus(isInfected: Array<IntArray>): Int {
        val rows = isInfected.size
        val cols = isInfected[0].size
        val directions = arrayOf(intArrayOf(1, 0), intArrayOf(-1, 0), intArrayOf(0, 1), intArrayOf(0, -1))
        var totalWalls = 0

        while (true) {
            val seen = Array(rows) { BooleanArray(cols) }
            val regions = mutableListOf<MutableList<IntArray>>()
            val frontiers = mutableListOf<MutableSet<String>>()
            val wallsNeeded = mutableListOf<Int>()

            for (r in 0 until rows) {
                for (c in 0 until cols) {
                    if (isInfected[r][c] != 1 || seen[r][c]) continue
                    val stack = ArrayDeque<IntArray>()
                    stack.addLast(intArrayOf(r, c))
                    seen[r][c] = true
                    val region = mutableListOf<IntArray>()
                    val frontier = mutableSetOf<String>()
                    var walls = 0
                    while (stack.isNotEmpty()) {
                        val cell = stack.removeLast()
                        val cr = cell[0]
                        val cc = cell[1]
                        region.add(intArrayOf(cr, cc))
                        for (d in directions) {
                            val nr = cr + d[0]
                            val nc = cc + d[1]
                            if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) continue
                            if (isInfected[nr][nc] == 1 && !seen[nr][nc]) {
                                seen[nr][nc] = true
                                stack.addLast(intArrayOf(nr, nc))
                            } else if (isInfected[nr][nc] == 0) {
                                walls++
                                frontier.add("$nr,$nc")
                            }
                        }
                    }
                    regions.add(region)
                    frontiers.add(frontier)
                    wallsNeeded.add(walls)
                }
            }

            if (regions.isEmpty()) break

            var target = 0
            for (i in 1 until frontiers.size) {
                if (frontiers[i].size > frontiers[target].size) {
                    target = i
                }
            }

            if (frontiers[target].isEmpty()) break

            totalWalls += wallsNeeded[target]

            for (cell in regions[target]) {
                isInfected[cell[0]][cell[1]] = -1
            }

            for (i in regions.indices) {
                if (i == target) continue
                for (coord in frontiers[i]) {
                    val parts = coord.split(",")
                    val r = parts[0].toInt()
                    val c = parts[1].toInt()
                    isInfected[r][c] = 1
                }
            }
        }

        return totalWalls
    }
}
