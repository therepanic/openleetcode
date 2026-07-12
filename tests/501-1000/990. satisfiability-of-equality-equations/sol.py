from typing import List


class Solution:
    def equationsPossible(self, equations: List[str]) -> bool:
        parent = list(range(26))
        rank = [0] * 26

        def find(x: int) -> int:
            if parent[x] != x:
                parent[x] = find(parent[x])
            return parent[x]

        def union(a: int, b: int) -> None:
            ra = find(a)
            rb = find(b)
            if ra == rb:
                return
            if rank[ra] < rank[rb]:
                parent[ra] = rb
            elif rank[ra] > rank[rb]:
                parent[rb] = ra
            else:
                parent[rb] = ra
                rank[ra] += 1

        for eq in equations:
            if eq[1] == "=":
                union(ord(eq[0]) - ord("a"), ord(eq[3]) - ord("a"))

        for eq in equations:
            if eq[1] == "!" and find(ord(eq[0]) - ord("a")) == find(
                ord(eq[3]) - ord("a")
            ):
                return False
        return True
