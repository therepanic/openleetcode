class Solution(object):
    def calcEquation(self, equations, values, queries):
        g = {}
        for (a, b), v in zip(equations, values):
            g.setdefault(a, {})[b] = v
            g.setdefault(b, {})[a] = 1.0 / v

        def f(x, y):
            if x not in g or y not in g:
                return -1.0
            s = [(x, 1.0)]
            v = set()
            while s:
                c, r = s.pop()
                if c == y:
                    return r
                v.add(c)
                for n in g[c]:
                    if n not in v:
                        s.append((n, r * g[c][n]))
            return -1.0

        return [f(a, b) for a, b in queries]
