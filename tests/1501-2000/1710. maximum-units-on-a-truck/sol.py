class Solution:
    def maximumUnits(self, boxTypes: List[List[int]], truckSize: int) -> int:
        # standard approach--------------------------------------------------------
        boxTypes.sort(reverse=True, key=lambda x: x[1])
        # print(f"{boxTypes=}")
        # boxTypes=[[5, 10], [3, 9], [4, 7], [2, 5]]
        ans = 0
        for a, b in boxTypes:
            quantitytaken = min(truckSize, a)
            ans += b * quantitytaken
            truckSize -= quantitytaken
            if truckSize == 0:
                break
        return ans

        # ============================================================================================

        # cool approach i learned in https://leetcode.com/problems/minimum-total-distance-traveled/description/
        # Robots and factory question.
        temp = []
        for a, b in boxTypes:
            # -------------------
            # for _ in range(a):
            #     temp.append(b)
            # -----------------
            t = [b] * a
            temp.extend(t)  # this way lind of faster casue implemented in c
            # -----------------

        temp.sort(reverse=True)
        # print(temp) [10, 10, 10, 10, 10, 9, 9, 9, 7, 7, 7, 7, 5, 5]
        return sum(temp[:truckSize])


# approach 2 is not scalable though mightfail for larger constraints
# ============================================================================================
