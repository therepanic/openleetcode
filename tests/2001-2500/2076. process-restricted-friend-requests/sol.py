class Solution(object):
    def friendRequests(self, n, restrictions, requests):
        """
        :type n: int
        :type restrictions: List[List[int]]
        :type requests: List[List[int]]
        :rtype: List[bool]
        """
        parent = list(range(n))

        def find(x):
            if parent[x] != x:
                parent[x] = find(parent[x])
            return parent[x]

        def union(x, y):
            root_x, root_y = find(x), find(y)
            if root_x == root_y:
                return True

            for a, b in restrictions:
                ra, rb = find(a), find(b)
                if (root_x == ra and root_y == rb) or (root_x == rb and root_y == ra):
                    return False

            parent[root_x] = root_y
            return True

        results = []
        for x, y in requests:
            results.append(union(x, y))
        return results