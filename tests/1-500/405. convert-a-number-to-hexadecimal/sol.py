class Solution(object):
    def toHex(self, num):
        if num == 0:
            return "0"
        if num < 0:
            num += 2**32
        h = "0123456789abcdef"
        r = []
        while num:
            r.append(h[num & 15])
            num //= 16
        return "".join(r[::-1])
