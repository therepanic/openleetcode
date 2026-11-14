class Solution(object):
    def countHighestScoreNodes(self, parents):
        """
        :type parents: List[int]
        :rtype: int
        """
        n = len(parents)
        tree = [[] for _ in range(n)]

        for i in range(1, n):
            tree[parents[i]].append(i)

        self.max_score = 0
        self.count = 0

        def dfs(node):
            score = 1
            size = 1 
            for child in tree[node]:
                subtree_size = dfs(child)
                score *= subtree_size
                size += subtree_size

            if node != 0:
                score *= (n - size)

            if score > self.max_score:
                self.max_score = score
                self.count = 1
            elif score == self.max_score:
                self.count += 1

            return size

        dfs(0)
        return self.count