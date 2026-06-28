from collections import defaultdict
from typing import List


class Solution:
    def basicCalculatorIV(
        self, expression: str, evalvars: List[str], evalints: List[int]
    ) -> List[str]:
        evalmap = dict(zip(evalvars, evalints))

        def combine(poly):
            # remove zero coefficients and sum like terms
            res = defaultdict(int)
            for k, v in poly.items():
                if v != 0:
                    res[k] += v
            return {k: v for k, v in res.items() if v != 0}

        def add(p1, p2):
            res = defaultdict(int, p1)
            for k, v in p2.items():
                res[k] += v
            return combine(res)

        def sub(p1, p2):
            res = defaultdict(int, p1)
            for k, v in p2.items():
                res[k] -= v
            return combine(res)

        def mul(p1, p2):
            res = defaultdict(int)
            for k1, v1 in p1.items():
                for k2, v2 in p2.items():
                    merged = tuple(sorted(k1 + k2))
                    res[merged] += v1 * v2
            return combine(res)

        def parse_token(tok):
            # integer literal?
            if tok.lstrip("-").isdigit():
                return {(): int(tok)}
            # substituted variable?
            if tok in evalmap:
                return {(): evalmap[tok]}
            # symbolic variable
            return {(tok,): 1}

        # tokenize (preserve parentheses and operators)
        tokens = []
        buf = ""
        for ch in expression:
            if ch.isalnum():
                buf += ch
            else:
                if buf:
                    tokens.append(buf)
                    buf = ""
                if ch in "+-*()":
                    tokens.append(ch)
                # ignore spaces
        if buf:
            tokens.append(buf)

        # parse using stacks
        def apply_op(vals, ops):
            op = ops.pop()
            b = vals.pop()
            a = vals.pop()
            if op == "+":
                vals.append(add(a, b))
            elif op == "-":
                vals.append(sub(a, b))
            else:
                vals.append(mul(a, b))

        vals, ops = [], []
        prec = {"+": 1, "-": 1, "*": 2}
        i = 0
        while i < len(tokens):
            tok = tokens[i]
            if tok == "(":
                ops.append(tok)
            elif tok == ")":
                while ops and ops[-1] != "(":
                    apply_op(vals, ops)
                ops.pop()
            elif tok in prec:
                while ops and ops[-1] in prec and prec[ops[-1]] >= prec[tok]:
                    apply_op(vals, ops)
                ops.append(tok)
            else:
                vals.append(parse_token(tok))
            i += 1
        while ops:
            apply_op(vals, ops)
        poly = vals[-1] if vals else {}

        # sort: degree desc, then lexicographically
        items = sorted(poly.items(), key=lambda iv: (-len(iv[0]), iv[0]))
        ans = []
        for vars_tuple, coeff in items:
            if coeff == 0:
                continue
            if vars_tuple:
                ans.append(str(coeff) + "*" + "*".join(vars_tuple))
            else:
                ans.append(str(coeff))
        return ans
