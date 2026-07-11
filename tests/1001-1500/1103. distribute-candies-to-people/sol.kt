class Solution {
    fun distributeCandies(candies: Int, num_people: Int): IntArray {
        val res = IntArray(num_people)
        var give = 1
        var i = 0
        var remaining = candies

        while (remaining > 0) {
            res[i % num_people] += minOf(give, remaining)
            remaining -= give
            give++
            i++
        }

        return res
    }
}
