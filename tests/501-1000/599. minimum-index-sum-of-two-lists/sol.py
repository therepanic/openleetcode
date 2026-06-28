class Solution:
    def findRestaurant(self, list1, list2):

        mp = {}

        mp[list1[0]] = float("-inf")

        for i in range(1, len(list1)):
            mp[list1[i]] = -i

        if list2[0] not in mp:
            mp[list2[0]] = float("-inf")
        else:
            if mp[list2[0]] != float("-inf"):
                mp[list2[0]] = abs(mp[list2[0]])
            else:
                mp[list2[0]] = 0

        for i in range(1, len(list2)):
            if list2[i] in mp:
                if mp[list2[i]] != float("-inf"):
                    mp[list2[i]] = abs(mp[list2[i]]) + i
                else:
                    mp[list2[i]] = i
            else:
                mp[list2[i]] = -i

        min_val = float("inf")

        for val in mp.values():
            if val >= 0:
                min_val = min(min_val, val)

        ans = []

        for key, val in mp.items():
            if val >= 0 and val == min_val:
                ans.append(key)

        return ans
