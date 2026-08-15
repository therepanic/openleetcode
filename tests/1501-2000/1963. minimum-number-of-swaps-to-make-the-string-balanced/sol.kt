class Solution {
    fun minSwaps(s: String): Int {
        var swap = 0
        for (c in s) {
            if (c == '[') {
                swap++
            } else {
                if (swap > 0) {
                    swap--
                }
            }
        }
        return (swap + 1) / 2
    }
}
