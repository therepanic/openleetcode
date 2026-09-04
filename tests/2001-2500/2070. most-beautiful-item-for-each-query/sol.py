class Solution:
    def maximumBeauty(self, items: List[List[int]], queries: List[int]) -> List[int]:

        items.sort()

        for i in range(1, len(items)):
            items[i][1] = max(items[i][1], items[i - 1][1])

        ans = []

        for q in queries:

            l, h = 0, len(items) - 1
            beauty = 0

            while l <= h:

                mid = (l + h) // 2

                if items[mid][0] <= q:
                    beauty = items[mid][1]
                    l = mid + 1
                else:
                    h = mid - 1

            ans.append(beauty)

        return ans