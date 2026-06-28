class Solution:
    def evaluate(self, expression: str) -> int:
        def isnum(t):
            return t[0] == "-" or t[0].isdigit()

        def lookup(v, env):
            for d in reversed(env):
                if v in d:
                    return d[v]
            return 0

        def toks(s):
            res = []
            i = 0
            n = len(s)
            bal = 0
            st = 0
            while i < n:
                c = s[i]
                if c == "(":
                    bal += 1
                elif c == ")":
                    bal -= 1
                elif c == " " and bal == 0:
                    if st < i:
                        res.append(s[st:i])
                    st = i + 1
                i += 1
            if st < n:
                res.append(s[st:])
            return res

        def evals(e, env):
            if e[0] != "(":
                return int(e) if isnum(e) else lookup(e, env)
            inner = e[1:-1]
            parts = toks(inner)
            op = parts[0]
            if op == "add":
                return evals(parts[1], env) + evals(parts[2], env)
            if op == "mult":
                return evals(parts[1], env) * evals(parts[2], env)
            loc = {}
            env.append(loc)
            i = 1
            while i < len(parts) - 1:
                v = parts[i]
                val = evals(parts[i + 1], env)
                loc[v] = val
                i += 2
            ans = evals(parts[-1], env)
            env.pop()
            return ans

        return evals(expression, [])
