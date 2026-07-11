class Solution:
    def atMostNGivenDigitSet(self, digits: List[str], n: int) -> int:

        f = lambda x: sum(ch < x for ch in digits)

        d, k = len(digits), len(str(n))

        ans = k - 1 if d == 1 else (d**k - d) // (d - 1)

        for i, ch in enumerate(str(n)):
            ans += f(ch) * (d ** (k - i - 1))
            if ch not in digits:
                break

        else:
            ans += 1

        return ans
