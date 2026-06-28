class Solution:
    def makeLargestSpecial(self, s: str) -> str:
        count = 0
        i = 0
        res = []

        for j in range(len(s)):
            # Track balance: +1 for '1', -1 for '0'
            count += 1 if s[j] == "1" else -1

            # Found a balanced chunk when count returns to 0
            if count == 0:
                # Recursively maximize inner part, wrap with 1...0
                res.append("1" + self.makeLargestSpecial(s[i + 1 : j]) + "0")
                i = j + 1  # Move to next potential chunk

        # Sort chunks in descending order for largest arrangement
        res.sort(reverse=True)
        return "".join(res)
