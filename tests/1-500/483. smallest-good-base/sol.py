from decimal import *


class Solution(object):
    def smallestGoodBase(self, n):

        getcontext().prec = 26

        for m in range(60, 1, -1):
            k = Decimal(2)
            for i in range(300):
                k = self.newtonMethod(k, m, int(n))

            basicRoundK = round(k)

            if round(k, 6) == basicRoundK and basicRoundK > 1:
                return str(basicRoundK)

    def newtonMethod(self, k, m, n):
        numerator = (((k**m) - 1) / (k - 1)) - n

        denominatorPt1 = m * (k - 1) * (k ** (m - 1)) - ((k**m) - 1)
        denominatorPt2 = (k - 1) ** 2
        totalDenom = denominatorPt1 / denominatorPt2

        return k - (numerator / totalDenom)
