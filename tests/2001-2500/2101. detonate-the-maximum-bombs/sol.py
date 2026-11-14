class Solution:
    def maximumDetonation(self, bombs: List[List[int]]) -> int:
        ad_list = defaultdict(list)

        for i in range(len(bombs)):
            x1, y1, r1 = bombs[i]
            for j in range(len(bombs)):
                if i == j:
                    continue
                x2, y2, r2 = bombs[j]

                circle_dist = (x2 -x1)**2 + (y2 - y1)**2
                if circle_dist <= r1**2:
                   ad_list[i].append(j)

        # Recursive call needs to be added here
        def dfs(bomb, visit_set):
            visited_set.add(bomb)
            for neighbor in ad_list[bomb]:
                if neighbor not in visit_set:
                    dfs(neighbor, visit_set)

        max_bombs = 0
        # Detonating bombs sequentially
        for i in range(len(bombs)):
            visited_set = set()
            dfs(i, visited_set)
            max_bombs = max(max_bombs, len(visited_set))
        print(max_bombs)
        return max_bombs