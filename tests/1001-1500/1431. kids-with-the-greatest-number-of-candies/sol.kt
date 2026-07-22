class Solution {
    fun kidsWithCandies(candies: IntArray, extraCandies: Int): List<Boolean> {
        val currentMax = candies.max()
        val result = mutableListOf<Boolean>()
        for (candyCount in candies) {
            if (candyCount + extraCandies >= currentMax) {
                result.add(true)
            } else {
                result.add(false)
            }
        }
        return result
    }
}
