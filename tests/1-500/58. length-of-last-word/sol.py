class Solution:
    def lengthOfLastWord(self, s):

        length = 0
        i = len(s) - 1

        # Skip trailing spaces
        while i >= 0 and s[i] == " ":
            i -= 1

        # Count last word length
        while i >= 0 and s[i] != " ":
            length += 1
            i -= 1

        return length
