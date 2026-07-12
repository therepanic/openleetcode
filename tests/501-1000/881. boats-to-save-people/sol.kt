class Solution {
    fun numRescueBoats(people: IntArray, limit: Int): Int {
        people.sort()
        var start = 0
        var end = people.size - 1
        var boats = 0
        
        while (start <= end) {
            if (people[start] + people[end] <= limit) {
                start++
                end--
            } else {
                end--
            }
            boats++
        }
        
        return boats
    }
}
