class Solution {
    fun prisonAfterNDays(cells: IntArray, n: Int): IntArray {
        var days = (n - 1) % 14 + 1
        for (day in 0 until days) {
            var prev = cells[0]
            for (i in 1 until cells.size - 1) {
                val current = cells[i]
                cells[i] = if (prev == cells[i + 1]) 1 else 0
                prev = current
            }
            cells[0] = 0
            cells[cells.size - 1] = 0
        }
        return cells
    }
}
