# If this solution helped you consider giving it an upvote
class Solution:
    def calculate(self, s: str) -> int:
        stack = []
        n = 0
        op = "+"
        s += "+"

        for c in s:
            if c == " ":
                continue

            if c.isdigit():
                n = n * 10 + int(c)
                continue

            if op == "+":
                stack.append(n)
            elif op == "-":
                stack.append(-n)
            elif op == "*":
                stack.append(stack.pop() * n)
            elif op == "/":
                stack.append(int(stack.pop() / n))

            op = c
            n = 0

        return sum(stack)
