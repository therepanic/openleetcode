class Solution:
    def halvesAreAlike(self, s: str) -> bool:
        vowels = "aeiouAEIOU"
        mid = len(s) // 2

        first_half = s[:mid]
        second_half = s[mid:]

        count1 = 0
        count2 = 0

        for c in first_half:
            if c in vowels:
                count1 += 1

        for c in second_half:
            if c in vowels:
                count2 += 1

        return count1 == count2
