class Solution:
    def minInsertions(self, s: str) -> int:
        stack = []
        count = 0
        i = 0

        while i < len(s):
            if s[i] == "(":
                stack.append("(")
            else:
                if not stack:
                    if i != len(s) - 1 and s[i + 1] == ")":
                        count += 1
                        i += 1  # Skip next ')'
                    else:
                        count += 2
                else:
                    if i != len(s) - 1 and s[i + 1] == ")":
                        stack.pop()
                        i += 1
                    else:
                        count += 1
                        stack.pop()
            i += 1

        return count + len(stack) * 2  # Each unmatched '(' needs two ')'
