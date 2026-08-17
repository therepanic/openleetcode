class Solution:
    def mergeTriplets(self, triplets: List[List[int]], target: List[int]) -> bool:
        if target in triplets:
            return True
        curr = [0, 0, 0]
        for i in range(len(triplets)):
            flag = False
            if target[0] == triplets[i][0] and curr[0] != target[0]:
                flag = True
            if target[1] == triplets[i][1] and curr[1] != target[1]:
                flag = True
            if target[2] == triplets[i][2] and curr[2] != target[2]:
                flag = True
            if flag:
                temp = curr
                curr = [
                    max(curr[0], triplets[i][0]),
                    max(curr[1], triplets[i][1]),
                    max(curr[2], triplets[i][2]),
                ]
                if curr[0] > target[0] or curr[1] > target[1] or curr[2] > target[2]:
                    curr = temp
        if curr == target:
            return True
        return False
