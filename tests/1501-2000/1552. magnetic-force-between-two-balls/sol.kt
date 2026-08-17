class Solution {
    fun maxDistance(position: IntArray, m: Int): Int {
        position.sort()
        var right = position[position.size - 1] - position[0]
        var left = 1
        
        while (left <= right) {
            val mid = (left + right) / 2
            var myBalls = 1
            var previous = position[0]
            
            for (i in 1 until position.size) {
                if (position[i] - previous >= mid) {
                    myBalls++
                    previous = position[i]
                }
            }
            
            if (myBalls >= m) {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return right
    }
}
