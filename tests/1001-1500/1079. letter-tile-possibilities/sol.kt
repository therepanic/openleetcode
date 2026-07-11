class Solution {
    fun numTilePossibilities(tiles: String): Int {
        val arr = tiles.toCharArray().sorted()
        val used = BooleanArray(arr.size)
        return backtrack(arr, used)
    }
    
    private fun backtrack(tiles: List<Char>, used: BooleanArray): Int {
        var count = 0
        for (i in tiles.indices) {
            if (used[i] || (i > 0 && tiles[i] == tiles[i - 1] && !used[i - 1])) {
                continue
            }
            used[i] = true
            count += 1 + backtrack(tiles, used)
            used[i] = false
        }
        return count
    }
}
