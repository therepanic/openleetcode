class Solution:
    def isNumber(self, s):
        numSeen = False
        dotSeen = False
        eSeen = False
        numAfterE = True

        for i, c in enumerate(s):
            if c.isdigit():
                numSeen = True
                numAfterE = True
            elif c == ".":
                if dotSeen or eSeen:
                    return False
                dotSeen = True
            elif c in ["e", "E"]:
                if eSeen or not numSeen:
                    return False
                eSeen = True
                numAfterE = False
            elif c in ["+", "-"]:
                if i > 0 and s[i - 1] not in ["e", "E"]:
                    return False
            else:
                return False

        return numSeen and numAfterE
