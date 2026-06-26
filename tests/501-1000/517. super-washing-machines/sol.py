class Solution:
    def findMinMoves(self, machines: List[int]) -> int:
        N = len(machines)
        total_sum = sum(machines)
        avg = total_sum // N

        if total_sum % N != 0:
            return -1

        imbalances = [machines[i] - avg for i in range(N)]

        res = float("-inf")
        D_i = 0
        for i in range(N):
            # account for the current boundary
            res = max(res, abs(D_i))

            # account for the current imbalance
            res = max(res, imbalances[i])

            # get the next boundary
            D_i += imbalances[i]

        return res
