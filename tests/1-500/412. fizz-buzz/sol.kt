class Solution {
    fun fizzBuzz(n: Int): List<String> {
        val result = mutableListOf<String>()
        for (i in 1..n) {
            when {
                i % 3 == 0 && i % 5 == 0 -> result.add("FizzBuzz")
                i % 5 == 0 -> result.add("Buzz")
                i % 3 == 0 -> result.add("Fizz")
                else -> result.add(i.toString())
            }
        }
        return result
    }
}
