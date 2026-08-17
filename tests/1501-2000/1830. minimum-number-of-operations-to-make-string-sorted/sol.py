class Solution:
    MOD = 10**9 + 7

    def makeStringSorted(self, s):
        n = len(s)
        fac = [1] * (n + 1)
        invFac = [1] * (n + 1)
        self.fillFactorial(fac, invFac, n)

        freq = [0] * 26
        for ch in s:
            freq[ord(ch) - ord("a")] += 1

        ans = 0
        for i in range(n):
            smallRight = 0
            for j in range(ord(s[i]) - ord("a")):
                smallRight += freq[j] % self.MOD

            rem = n - i - 1
            temp = 1
            temp = (temp * fac[rem]) % self.MOD
            temp = (temp * smallRight) % self.MOD

            for x in freq:
                if x > 1:
                    temp = (temp * invFac[x]) % self.MOD

            freq[ord(s[i]) - ord("a")] -= 1
            ans = (ans + temp) % self.MOD

        return ans % self.MOD

    def modPow(self, x, n):
        if x == 1 or n == 0:
            return 1
        if n == 1:
            return x % self.MOD

        if n % 2:
            return (x * self.modPow((x * x) % self.MOD, n // 2)) % self.MOD
        return self.modPow((x * x) % self.MOD, n // 2) % self.MOD

    def fillFactorial(self, fac, invFac, n):
        for i in range(1, n + 1):
            fac[i] = (fac[i - 1] * i) % self.MOD
        invFac[n] = self.modPow(fac[n], self.MOD - 2)
        for i in range(n, 0, -1):
            invFac[i - 1] = (invFac[i] * i) % self.MOD
