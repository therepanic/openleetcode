from typing import List


class Solution:
    def numOfMinutes(
        self, n: int, headID: int, manager: List[int], informTime: List[int]
    ) -> int:
        children = [[] for _ in range(n)]
        for employee, parent in enumerate(manager):
            if parent != -1:
                children[parent].append(employee)
        stack = [(headID, 0)]
        answer = 0
        while stack:
            employee, elapsed = stack.pop()
            answer = max(answer, elapsed)
            for child in children[employee]:
                stack.append((child, elapsed + informTime[employee]))
        return answer
