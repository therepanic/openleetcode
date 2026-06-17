class Solution(object):
    def findMinHeightTrees(self, n, edges):
        if n < 3:
            return list(range(n))

        adjacency_list = [set() for _ in range(n)]
        for a, b in edges:
            adjacency_list[a].add(b)
            adjacency_list[b].add(a)

        leaves = [i for i in range(n) if len(adjacency_list[i]) == 1]

        while n > 2:
            n -= len(leaves)
            new_leaves = []
            for leaf in leaves:
                neighbor = adjacency_list[leaf].pop()
                adjacency_list[neighbor].remove(leaf)
                if len(adjacency_list[neighbor]) == 1:
                    new_leaves.append(neighbor)
            leaves = new_leaves

        return leaves
