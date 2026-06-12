class Solution(object):
    def candy(self, ratings):
        n = len(ratings)
        cnt = 0
        candies = [1] * n
        for i in range(1, n):
            if ratings[i] > ratings[i - 1]:
                candies[i] = candies[i - 1] + 1
        for i in range(n - 1, 0, -1):
            if ratings[i - 1] > ratings[i]:
                candies[i - 1] = max(candies[i] + 1, candies[i - 1])
            cnt += candies[i - 1]
        return cnt + candies[n - 1]
