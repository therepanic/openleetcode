class Solution {
    fun multiply(num1: String, num2: String): String {
        val n = num1.length
        val m = num2.length
        val result = IntArray(n + m)

        for (i in n - 1 downTo 0) {
            for (j in m - 1 downTo 0) {
                val mul = (num1[i] - '0') * (num2[j] - '0')
                val sum = mul + result[i + j + 1]
                result[i + j + 1] = sum % 10
                result[i + j] += sum / 10
            }
        }

        val product = StringBuilder()
        var k = 0
        while (k < result.size && result[k] == 0) {
            k++
        }
        if (k == result.size) return "0"
        while (k < result.size) {
            product.append(result[k])
            k++
        }
        return product.toString()
    }
}
