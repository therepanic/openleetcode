class Solution:
    def tribonacci(self, n):

        ft, st, tt = 0, 1, 1

        for i in range(1, n + 1):
            frt = ft + st + tt
            ft = st
            st = tt
            tt = frt

        return ft
