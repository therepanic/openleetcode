class Solution(object):
    def calculate(self, s):
        """
        :type s: str
        :rtype: int
        """
        stack = []
        res = 0
        curr = 0
        sign = 1

        for c in s:
            if c.isdigit():
                curr = curr * 10 + int(c)
            elif c == '+':
                res += sign * curr
                sign = 1
                curr = 0
            elif c == '-':
                res += sign * curr
                sign = -1
                curr = 0
            elif c == '(':
                stack.append(res)
                stack.append(sign)
                res = 0
                sign = 1
            elif c == ')':
                res += sign * curr
                curr = 0
                res *= stack.pop()
                res += stack.pop()

        res += sign * curr
        return res
