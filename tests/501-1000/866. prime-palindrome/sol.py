class Solution:
    def primePalindrome(self, n: int) -> int:
        def is_prime(num: int) -> bool:
            if num < 2:
                return False
            if num % 2 == 0:
                return num == 2
            for i in range(3, int(num**0.5) + 1, 2):
                if num % i == 0:
                    return False
            return True

        if 8 <= n <= 11:
            return 11

        while True:
            s = str(n)
            if len(s) % 2 == 0 and n > 11:
                n = 10 ** len(s) + 1
                continue
            if s == s[::-1] and is_prime(n):
                return n
            n += 1
            if n > 2 and n % 2 == 0:
                n += 1
