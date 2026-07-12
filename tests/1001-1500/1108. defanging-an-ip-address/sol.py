class Solution(object):
    def defangIPaddr(self, address: str) -> str:
        s = ""
        for i in address:
            if i == ".":
                s += "[.]"
            else:
                s += i
        return s
