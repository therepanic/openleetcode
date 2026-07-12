class Solution {
    fun addNegabinary(arr1: IntArray, arr2: IntArray): IntArray {
        val res = mutableListOf<Int>()
        var i = arr1.size - 1
        var j = arr2.size - 1
        var carry = 0
        
        while (carry != 0 || i >= 0 || j >= 0) {
            if (i >= 0) carry += arr1[i--]
            if (j >= 0) carry += arr2[j--]
            res.add(carry and 1)
            carry = -(carry shr 1)
        }
        
        while (res.size > 1 && res.last() == 0) {
            res.removeAt(res.size - 1)
        }
        
        return res.reversed().toIntArray()
    }
}
