class Solution {
    fun powerfulIntegers(x: Int, y: Int, bound: Int): List<Int> {
        val result = mutableSetOf<Int>()
        var i = 1

        while (i <= bound) {
            var j = 1
            while (i + j <= bound) {
                result.add(i + j)
                if (y == 1) break
                j *= y
            }
            if (x == 1) break
            i *= x
        }
        
        return result.toList()
    }
}
