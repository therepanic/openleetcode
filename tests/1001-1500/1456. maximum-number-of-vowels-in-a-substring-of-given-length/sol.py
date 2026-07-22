class Solution:
    def is_vowel(self, c: str) -> bool:
        return c in {"a", "e", "i", "o", "u"}

    def maxVowels(self, s: str, k: int) -> int:
        max_vowel = 0
        left = 0
        vowel = 0

        for right in range(len(s)):
            if self.is_vowel(s[right]):
                vowel += 1

            if (right - left + 1) == k:
                max_vowel = max(max_vowel, vowel)
                if self.is_vowel(s[left]):
                    vowel -= 1
                left += 1

        return max_vowel
