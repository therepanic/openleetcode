class Solution(object):
    def countArrangement(self, n):
        def backtrack(index, visited):
            if index > n:
                return 1
            count = 0
            for i in range(1, n + 1):
                if not visited[i] and (i % index == 0 or index % i == 0):
                    visited[i] = True
                    count += backtrack(index + 1, visited)
                    visited[i] = False
            return count

        visited = [False] * (n + 1)
        return backtrack(1, visited)
