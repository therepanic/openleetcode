class Solution:
    def evalRPN(self, tokens: List[str]) -> int:
        def calc(a, b, op):
            if op == "+":
                return a + b
            elif op == "-":
                return a - b
            elif op == "/":
                return int(a / b)
            elif op == "*":
                return a * b

        stack = []
        for t in tokens:
            if t in {"+", "*", "-", "/"}:
                a = stack.pop(-1)
                b = stack.pop(-1)
                stack.append(calc(b, a, t))
            else:
                stack.append(int(t))
        return stack[0]
