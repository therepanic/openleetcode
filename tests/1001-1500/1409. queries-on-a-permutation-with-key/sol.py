from typing import List


class Solution:
    def processQueries(self, queries: List[int], m: int) -> List[int]:
        arr = []
        ans = []
        for i in range(1, m + 1):
            arr.append(i)
        for x in queries:
            ans.append(arr.index(x))
            arr.remove(x)
            arr.insert(0, x)
        return ans
