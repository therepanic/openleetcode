class Solution:
    def parseBoolExpr(self, expression: str) -> bool:
        st = [[]]
        for ch in expression:
            if ch == "&":
                st.append([all])
            elif ch == "|":
                st.append([any])
            elif ch == "!":
                st.append([lambda q: not q[0]])
            elif ch == "t":
                st[-1].append(True)
            elif ch == "f":
                st[-1].append(False)
            elif ch == ")":
                operation, *args = st.pop()
                st[-1].append(operation(args))

        return st[0][0]
