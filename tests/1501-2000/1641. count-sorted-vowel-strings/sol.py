class Solution:
    def countVowelStrings(self, n: int) -> int:
        if n == 1:
            return 5
        elif n == 2:
            return 15
        elif n == 3:
            return 35
        x = [10]
        c = 5
        for i in range(n - 3):
            x.append(x[i] + c)
            c += 1
        y = [10]
        for i in range(n - 2):
            y.append(y[i] + x[i])
        return sum(y) + 5
