class Solution(object):
    def countCombinations(self, pieces, positions):
        n = len(pieces)

        mp = {
            "bishop": ((-1,-1),(-1,1),(1,-1),(1,1)),
            "queen": ((-1,-1),(-1,0),(-1,1),
                      (0,-1),(0,1),
                      (1,-1),(1,0),(1,1)),
            "rook": ((-1,0),(0,-1),(0,1),(1,0))
        }

        dirs = [[]]
        for piece in pieces:
            dirs = [x + [d] for x in dirs for d in mp[piece]]

        positions = tuple(tuple(x) for x in positions)

        ans = set()

        def fn(*args):
            stack = [((1 << n) - 1, positions)]
            while stack:
                mask, pos = stack.pop()
                ans.add(pos)

                m = mask
                while m:
                    p = []
                    ok = True
                    for i in range(n):
                        if m & (1 << i):
                            nr = pos[i][0] + args[i][0]
                            nc = pos[i][1] + args[i][1]
                            if not (1 <= nr <= 8 and 1 <= nc <= 8):
                                ok = False
                                break
                            p.append((nr, nc))
                        else:
                            p.append(pos[i])

                    if ok:
                        cand = tuple(p)
                        if len(set(cand)) == len(cand):
                            stack.append((m, cand))

                    m = mask & (m - 1)

        for d in dirs:
            fn(*d)

        return len(ans)