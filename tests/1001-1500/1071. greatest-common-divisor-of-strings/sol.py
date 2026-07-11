class Solution:
    def gcdOfStrings(self, str1: str, str2: str) -> str:

        if str1 + str2 != str2 + str1:
            return ""

        def gcd(len1, len2):
            min_val = min(len1, len2)
            for i in range(min_val, 0, -1):
                if len1 % i == 0 and len2 % i == 0:
                    return i
            return 1

        return str1[: gcd(len(str1), len(str2))]
