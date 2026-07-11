class Solution(object):
    def numberOfLines(self, widths, s):
        lines = 1
        current = 0
        for c in s:
            w = widths[ord(c) - 97]
            if current + w > 100:
                lines += 1
                current = w
            else:
                current += w
        return [lines, current]
