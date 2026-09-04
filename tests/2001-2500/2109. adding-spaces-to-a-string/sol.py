class Solution:
    def addSpaces(self, s, spaces):
        result = []
        previous = 0
        for index in spaces:
            result.append(s[previous:index])
            result.append(" ")
            previous = index
        result.append(s[previous:])
        return "".join(result)
