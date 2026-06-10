class Solution(object):
    def fractionToDecimal(self, numerator, denominator):
        if not numerator:
            return "0"

        result = []
        if (numerator < 0) ^ (denominator < 0):
            result.append("-")

        num = abs(numerator)
        den = abs(denominator)

        result.append(str(num // den))
        num %= den

        if not num:
            return "".join(result)

        result.append(".")
        seen = {}

        while num:
            if num in seen:
                result.insert(seen[num], "(")
                result.append(")")
                break
            seen[num] = len(result)
            num *= 10
            result.append(str(num // den))
            num %= den

        return "".join(result)
