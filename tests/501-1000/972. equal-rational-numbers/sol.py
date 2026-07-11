from fractions import Fraction


class Solution:
    def isRationalEqual(self, s: str, t: str) -> bool:
        def parse(x: str) -> Fraction:
            if "." not in x:
                return Fraction(int(x), 1)
            integer, frac = x.split(".", 1)
            if "(" not in frac:
                if frac == "":
                    return Fraction(int(integer), 1)
                return Fraction(int(integer), 1) + Fraction(int(frac), 10 ** len(frac))
            nonrep, rep = frac.split("(", 1)
            rep = rep[:-1]
            base = Fraction(int(integer), 1)
            if nonrep:
                base += Fraction(int(nonrep), 10 ** len(nonrep))
            repeat_num = int(rep)
            repeat_den = (10 ** len(rep) - 1) * (10 ** len(nonrep))
            return base + Fraction(repeat_num, repeat_den)

        return parse(s) == parse(t)
