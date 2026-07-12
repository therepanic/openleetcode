class Solution {
    fun uniqueMorseRepresentations(words: Array<String>): Int {
        val storage = arrayOf(
            ".-", "-...", "-.-.", "-..", ".", "..-.", "--.",
            "....", "..", ".---", "-.-", ".-..", "--", "-.",
            "---", ".--.", "--.-", ".-.", "...", "-", "..-",
            "...-", ".--", "-..-", "-.--", "--.."
        )

        val st = mutableSetOf<String>()

        for (word in words) {
            val temp = StringBuilder()
            for (ch in word) {
                temp.append(storage[ch - 'a'])
            }
            st.add(temp.toString())
        }

        return st.size
    }
}
