class Solution:
    def findRedundantConnection(self, edges: List[List[int]]) -> List[int]:

        matrix = [[] for i in range(len(edges) + 1)]
        for a, b in edges:
            matrix[a].append(b)
            matrix[b].append(a)

        visited = set()
        path = set()
        cycleStart = -1

        def dfs(i, parent):
            nonlocal cycleStart
            if i in visited:
                return False

            visited.add(i)
            for node in matrix[i]:
                if node not in visited:
                    if dfs(node, i) == True:
                        if cycleStart != -1:
                            path.add(node)
                        if node == cycleStart:
                            cycleStart = -1
                        return True
                elif node != parent:  # node visited and it wasnt my parent
                    path.add(node)
                    cycleStart = node
                    return True
            return False

        for i in range(len(edges), 0, -1):
            if dfs(i, -1) == True:
                break
        print(path)
        for k in range(len(edges) - 1, -1, -1):
            a, b = edges[k]
            if a in path and b in path:
                return [a, b]
