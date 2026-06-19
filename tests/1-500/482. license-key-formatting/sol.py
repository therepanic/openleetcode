class Solution:
    def licenseKeyFormatting(self, s: str, k: int) -> str:
        s = s.replace("-", "").upper()
        result = []

        for i in range(len(s), 0, -k):
            result.append(s[max(0, i - k) : i])

        return "-".join(result[::-1])
