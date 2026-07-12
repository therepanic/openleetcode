class Solution:
    def uniqueMorseRepresentations(self, words):

        storage = [
            ".-",
            "-...",
            "-.-.",
            "-..",
            ".",
            "..-.",
            "--.",
            "....",
            "..",
            ".---",
            "-.-",
            ".-..",
            "--",
            "-.",
            "---",
            ".--.",
            "--.-",
            ".-.",
            "...",
            "-",
            "..-",
            "...-",
            ".--",
            "-..-",
            "-.--",
            "--..",
        ]

        st = set()

        for word in words:
            temp = ""

            for ch in word:
                temp += storage[ord(ch) - ord("a")]

            st.add(temp)

        return len(st)
