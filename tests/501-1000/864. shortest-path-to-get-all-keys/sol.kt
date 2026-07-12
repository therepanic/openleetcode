import java.util.*

class Solution {
    fun shortestPathAllKeys(grid: Array<String>): Int {
        val m = grid.size
        val n = grid[0].length
        var start_i = 0
        var start_j = 0
        var total_keys = 0
        
        for (i in 0 until m) {
            for (j in 0 until n) {
                val c = grid[i][j]
                if (c == '@') {
                    start_i = i
                    start_j = j
                }
                if (c in 'a'..'f') {
                    total_keys++
                }
            }
        }
        
        val target_mask = (1 shl total_keys) - 1
        val queue: Queue<Triple<Int, Int, Int>> = LinkedList()
        queue.offer(Triple(start_i, start_j, 0))
        val seen = Array(m) { Array(n) { BooleanArray(1 shl total_keys) } }
        seen[start_i][start_j][0] = true
        var moves = 0
        val dirs = arrayOf(intArrayOf(0, 1), intArrayOf(0, -1), intArrayOf(1, 0), intArrayOf(-1, 0))
        
        while (queue.isNotEmpty()) {
            val size = queue.size
            repeat(size) {
                val (r, c, mask) = queue.poll()
                
                if (mask == target_mask) {
                    return moves
                }
                
                for (dir in dirs) {
                    val nr = r + dir[0]
                    val nc = c + dir[1]
                    
                    if (nr !in 0 until m || nc !in 0 until n) {
                        continue
                    }
                    
                    val next_val = grid[nr][nc]
                    var next_mask = mask
                    
                    if (next_val in 'a'..'f') {
                        val key_bit = next_val - 'a'
                        next_mask = next_mask or (1 shl key_bit)
                    }
                    
                    if (next_val in 'A'..'F') {
                        val lock_bit = next_val.lowercaseChar() - 'a'
                        if ((next_mask and (1 shl lock_bit)) == 0) {
                            continue
                        }
                    }
                    
                    if (!seen[nr][nc][next_mask] && next_val != '#') {
                        queue.offer(Triple(nr, nc, next_mask))
                        seen[nr][nc][next_mask] = true
                    }
                }
            }
            moves++
        }
        
        return -1
    }
}
