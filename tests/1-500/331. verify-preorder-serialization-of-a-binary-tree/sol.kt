class Solution {
    fun isValidSerialization(preorder: String): Boolean {
        var slots = 1
        for (node in preorder.split(",")) {
            slots--
            if (slots < 0) return false
            if (node != "#") slots += 2
        }
        return slots == 0
    }
}
