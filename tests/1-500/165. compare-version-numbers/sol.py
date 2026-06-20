class Solution(object):
    def compareVersion(self, version1, version2):
        v1 = list(map(int, version1.split(".")))
        v2 = list(map(int, version2.split(".")))

        while len(v1) < len(v2):
            v1.append(0)
        while len(v2) < len(v1):
            v2.append(0)

        for a, b in zip(v1, v2):
            if a < b:
                return -1
            elif a > b:
                return 1

        return 0
