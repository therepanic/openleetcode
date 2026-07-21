class Solution:
    def groupThePeople(self, groupSizes: List[int]) -> List[List[int]]:
        ans = []
        mp = defaultdict(list)
        for i, val in enumerate(groupSizes):
            if len(mp[val]) < val:
                mp[val].append(i)
                if len(mp[val]) == val:
                    ans.append(mp[val])
                    mp[val] = []
        return ans
