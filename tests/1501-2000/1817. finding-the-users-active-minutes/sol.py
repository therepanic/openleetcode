class Solution:
    def findingUsersActiveMinutes(self, logs, k):
        mp = {}
        for user, minute in logs:
            if user not in mp:
                mp[user] = set()
            mp[user].add(minute)
        ans = [0] * k
        for user in mp:
            size = len(mp[user])
            if size <= k:
                ans[size - 1] += 1
        return ans
