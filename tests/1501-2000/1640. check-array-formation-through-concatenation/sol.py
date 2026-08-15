class Solution(object):
    def canFormArray(self, arr, pieces):
        a = []
        for i in arr:
            for j in pieces:
                if i in j:
                    for k in j:
                        a.append(k)
                    pieces.remove(j)
                    break
        if a == arr:
            return True
        return False
