class Solution {
    fun numOfBurgers(tomatoSlices: Int, cheeseSlices: Int): List<Int> {
        if ((tomatoSlices - 2 * cheeseSlices) % 2 != 0) {
            return emptyList()
        }

        val x = (tomatoSlices - 2 * cheeseSlices) / 2
        val y = cheeseSlices - x

        if (x < 0 || y < 0) {
            return emptyList()
        }

        return listOf(x, y)
    }
}
