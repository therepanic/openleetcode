class Solution {
    fun maxNumberOfFamilies(n: Int, reservedSeats: Array<IntArray>): Int {
        val rowSeats = mutableMapOf<Int, MutableSet<Int>>()
        
        for ((row, seat) in reservedSeats) {
            rowSeats.getOrPut(row) { mutableSetOf() }.add(seat)
        }
        
        var ans = (n - rowSeats.size) * 2
        
        val option1 = setOf(2, 3, 4, 5)
        val option2 = setOf(6, 7, 8, 9)
        val option3 = setOf(4, 5, 6, 7)
        
        for (seats in rowSeats.values) {
            var available = 0
            if (seats.intersect(option1).isEmpty()) {
                available += 1
            }
            if (seats.intersect(option2).isEmpty()) {
                available += 1
            }
            if (seats.intersect(option3).isEmpty()) {
                available = maxOf(available, 1)
            }
            ans += available
        }
        
        return ans
    }
}
