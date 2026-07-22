class Solution {
    fun filterRestaurants(restaurants: Array<IntArray>, veganFriendly: Int, maxPrice: Int, maxDistance: Int): List<Int> {
        val restaurantsFiltered = mutableListOf<IntArray>()

        for (restaurant in restaurants) {
            if (veganFriendly == 1 && restaurant[2] != 1) {
                continue
            }
            
            if (restaurant[3] > maxPrice) {
                continue
            }

            if (restaurant[4] > maxDistance) {
                continue
            }

            restaurantsFiltered.add(intArrayOf(restaurant[1], restaurant[0]))
        }

        restaurantsFiltered.sortWith(compareByDescending<IntArray> { it[0] }.thenByDescending { it[1] })

        val result = mutableListOf<Int>()

        for (restaurant in restaurantsFiltered) {
            result.add(restaurant[1])
        }

        return result
    }
}
