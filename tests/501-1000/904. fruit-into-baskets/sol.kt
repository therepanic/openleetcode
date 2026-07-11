class Solution {
    fun totalFruit(fruits: IntArray): Int {
        var start = 0
        var maxLen = 0
        val fruitCount = mutableMapOf<Int, Int>()
        
        for (end in fruits.indices) {
            fruitCount[fruits[end]] = fruitCount.getOrDefault(fruits[end], 0) + 1
            
            while (fruitCount.size > 2) {
                val leftFruit = fruits[start]
                fruitCount[leftFruit] = fruitCount[leftFruit]!! - 1
                if (fruitCount[leftFruit] == 0) {
                    fruitCount.remove(leftFruit)
                }
                start++
            }
            
            maxLen = maxOf(maxLen, end - start + 1)
        }
        
        return maxLen
    }
}
