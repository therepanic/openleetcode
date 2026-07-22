class Solution {
    fun breakPalindrome(palindrome: String): String {
        if (palindrome.length == 1) return ""
        val arr = palindrome.toCharArray()
        for (i in 0 until arr.size / 2) {
            if (arr[i] != 'a') {
                arr[i] = 'a'
                return String(arr)
            }
        }
        arr[arr.size - 1] = 'b'
        return String(arr)
    }
}
