class Solution:
    def distributeCandies(self, candies, num_people):
        res = [0] * num_people
        give = 1
        i = 0

        while candies > 0:
            res[i % num_people] += min(give, candies)
            candies -= give
            give += 1
            i += 1

        return res
