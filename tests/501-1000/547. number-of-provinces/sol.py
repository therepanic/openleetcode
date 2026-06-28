class Solution(object):
    def findCircleNum(self, isConnected):
        n = len(isConnected)
        visited = [False] * n
        count = 0

        def dfs(city):
            for neighbor in range(n):
                if isConnected[city][neighbor] == 1 and not visited[neighbor]:
                    visited[neighbor] = True
                    dfs(neighbor)

        for city in range(n):
            if not visited[city]:
                visited[city] = True
                dfs(city)
                count += 1

        return count
