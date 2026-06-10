class Solution {
    fun largestNumber(nums: IntArray): String {
        val parts = ArrayList<String>(nums.size)
        for (num in nums) parts.add(num.toString())
        parts.sortWith(java.util.Comparator<String> { a, b ->
            (b + a).compareTo(a + b)
        })
        if (parts.isNotEmpty() && parts[0] == "0") return "0"
        return parts.joinToString("")
    }
}
