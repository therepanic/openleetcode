class Solution(object):
    def solveEquation(self, equation):
        left, right = equation.split("=")

        def parse_side(side):
            coeff = 0
            const = 0
            num = ""
            sign = 1
            for char in side + "+":
                if char in "+-":
                    if num:
                        const += sign * int(num)
                        num = ""
                    sign = 1 if char == "+" else -1
                elif char.isdigit():
                    num += char
                elif char == "x":
                    coeff += sign * (int(num) if num else 1)
                    num = ""
            return coeff, const

        left_coeff, left_const = parse_side(left)
        right_coeff, right_const = parse_side(right)

        coeff = left_coeff - right_coeff
        const = right_const - left_const

        if coeff == 0:
            return "No solution" if const != 0 else "Infinite solutions"
        return "x={}".format(const // coeff)
