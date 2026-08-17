class Solution {
    private lateinit var grid: Array<String>
    private var m = 0
    private var n = 0
    private var catJump = 0
    private var mouseJump = 0
    private val dirs = arrayOf(intArrayOf(-1,0), intArrayOf(0,1), intArrayOf(1,0), intArrayOf(0,-1))
    private val walls = mutableSetOf<Int>()
    private lateinit var food: IntArray
    private val memo = mutableMapOf<Int, Boolean>()

    fun canMouseWin(grid: Array<String>, catJump: Int, mouseJump: Int): Boolean {
        this.grid = grid
        this.catJump = catJump
        this.mouseJump = mouseJump
        m = grid.size
        n = grid[0].length

        var cat = 0
        var mouse = 0
        for (i in 0 until m) {
            for (j in 0 until n) {
                when (grid[i][j]) {
                    'F' -> food = intArrayOf(i, j)
                    'C' -> cat = i * n + j
                    'M' -> mouse = i * n + j
                    '#' -> walls.add(i * n + j)
                }
            }
        }

        return dfs(cat, mouse, 0)
    }

    private fun key(cat: Int, mouse: Int, turn: Int): Int {
        return ((cat * m * n + mouse) * (m * n * 2) + turn)
    }

    private fun dfs(cat: Int, mouse: Int, turn: Int): Boolean {
        val k = key(cat, mouse, turn)
        memo[k]?.let { return it }

        val cx = cat / n
        val cy = cat % n
        val mx = mouse / n
        val my = mouse % n

        if ((cat == food[0] * n + food[1]) || cat == mouse || turn >= m * n * 2) {
            memo[k] = false
            return false
        }
        if (mouse == food[0] * n + food[1]) {
            memo[k] = true
            return true
        }

        var result: Boolean
        if (turn % 2 == 0) { // mouse
            result = false
            outer@ for (d in dirs) {
                for (jump in 0..mouseJump) {
                    val nx = mx + jump * d[0]
                    val ny = my + jump * d[1]
                    if (nx < 0 || nx >= m || ny < 0 || ny >= n || walls.contains(nx * n + ny)) break
                    if (dfs(cat, nx * n + ny, turn + 1)) {
                        result = true
                        break@outer
                    }
                }
            }
        } else { // cat
            result = true
            outer@ for (d in dirs) {
                for (jump in 0..catJump) {
                    val nx = cx + jump * d[0]
                    val ny = cy + jump * d[1]
                    if (nx < 0 || nx >= m || ny < 0 || ny >= n || walls.contains(nx * n + ny)) break
                    if (!dfs(nx * n + ny, mouse, turn + 1)) {
                        result = false
                        break@outer
                    }
                }
            }
        }

        memo[k] = result
        return result
    }
}
