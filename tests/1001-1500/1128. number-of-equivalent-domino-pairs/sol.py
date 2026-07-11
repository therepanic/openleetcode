class Solution(object):
    def numEquivDominoPairs(self, dominoes):
        mpp = [0] * 100
        count = 0
        for a, b in dominoes:
            key = a * 10 + b if a <= b else b * 10 + a
            count += mpp[key]
            mpp[key] += 1
        return count
