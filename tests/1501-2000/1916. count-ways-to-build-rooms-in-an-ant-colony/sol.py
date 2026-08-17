from math import comb


class Solution:
    def waysToBuildRooms(self, prevRoom: List[int]) -> int:
        tree = defaultdict(list)
        for i, x in enumerate(prevRoom):
            tree[x].append(i)

        def fn(n):
            """Return number of nodes and ways to build sub-tree."""
            if not tree[n]:
                return 1, 1  # leaf
            c, m = 0, 1
            for nn in tree[n]:
                cc, mm = fn(nn)
                c += cc
                m = (m * comb(c, cc) * mm) % 1_000_000_007
            return c + 1, m

        return fn(0)[1]
