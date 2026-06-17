import heapq

class Solution(object):
    def kSmallestPairs(self, nums1, nums2, k):
        if not nums1 or not nums2:
            return []

        h = []
        visited = set()
        result = []

        heapq.heappush(h, (nums1[0] + nums2[0], 0, 0))
        visited.add((0, 0))

        while h and len(result) < k:
            s, i, j = heapq.heappop(h)
            result.append([nums1[i], nums2[j]])

            if j + 1 < len(nums2) and (i, j + 1) not in visited:
                visited.add((i, j + 1))
                heapq.heappush(h, (nums1[i] + nums2[j + 1], i, j + 1))

            if i + 1 < len(nums1) and (i + 1, j) not in visited:
                visited.add((i + 1, j))
                heapq.heappush(h, (nums1[i + 1] + nums2[j], i + 1, j))

        return result