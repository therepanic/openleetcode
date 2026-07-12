class Solution(object):
    def numFriendRequests(self, ages):
        cnt = [0] * 121
        for age in ages:
            cnt[age] += 1
        pre = [0] * 122
        for i in range(121):
            pre[i + 1] = pre[i] + cnt[i]
        ans = 0
        for age in range(15, 121):
            if cnt[age]:
                lower = int(age * 0.5 + 7)
                total = pre[age + 1] - pre[lower + 1]
                ans += cnt[age] * (total - 1)
        return ans
