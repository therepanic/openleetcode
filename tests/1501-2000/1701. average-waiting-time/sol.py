class Solution:
    def averageWaitingTime(self, customers: List[List[int]]) -> float:
        waiting, current = 0, 0
        for arrival, time in customers:
            if current <= arrival:
                current = arrival + time
                waiting += time
            else:
                current += time
                waiting += current - arrival
        return waiting / len(customers)
