class Solution(object):
    def minimumOperations(self, nums, start, goal):
        """
        :type nums: List[int]
        :type start: int
        :type goal: int
        :rtype: int
        """
        visited = [False] * 1001
        queue = deque()
        queue.append((start, 0))

        while queue:
            x, steps = queue.popleft()

            if x == goal:
                return steps

            if 0 <= x <= 1000 and visited[x]:
                continue
            if 0 <= x <= 1000:
                visited[x] = True

            for num in nums:
                for new_x in (x + num, x - num, x ^ num):
                    if 0 <= new_x <= 1000 and not visited[new_x]:
                        queue.append((new_x, steps + 1))
                    elif new_x == goal:
                        return steps + 1

        return -1