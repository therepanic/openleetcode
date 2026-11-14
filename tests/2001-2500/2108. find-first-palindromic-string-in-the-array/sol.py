class Solution:
    def firstPalindrome(self, words):
        """
        :type words: list of str
        :rtype: str
        """
        for word in words:
            if self.isPalindrome(word):
                return word
        return ""

    def isPalindrome(self, s):
        i, j = 0, len(s) - 1
        while i < j:
            if s[i] != s[j]:
                return False
            i += 1
            j -= 1
        return True