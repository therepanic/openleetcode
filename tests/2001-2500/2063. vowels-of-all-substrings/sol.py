class Solution:
    def countVowels(self, word: str) -> int:

        vowels = set("aeiou")
        n = len(word)
        ans = 0

        for i in range(n):
            if word[i] in vowels:
                left = i + 1
                right = n - i
                ans += left * right

        return ans