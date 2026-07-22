class Solution:
    def average(self, salary: List[int]) -> float:
        res = max(salary)
        res1 = min(salary)
        salary.remove(res)
        salary.remove(res1)
        Total = 0.00000
        for i in salary:
            Total = Total + i

        M = Total / len(salary)
        return M
