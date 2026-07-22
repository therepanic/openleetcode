class Solution(object):
    def checkIfExist(self, arr):
        if arr.count(0) >= 2:
            return True

        for i in arr:
            if i != 0 and i * 2 in arr:
                return True

        return False
