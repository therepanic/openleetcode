class Solution:
    def minSessions(self, tasks: List[int], sessionTime: int) -> int:
        # feasibility:
        # for T tasks, can we fit them in N sessions?
        # partition array s.t. max sum is T.

        tasks.sort(reverse=True)

        def feasibility(N):
            sessions = [0] * N

            def dfs(i):
                if max(sessions) > sessionTime:
                    return False
                if i == len(tasks):
                    return True

                for s in range(N):
                    sessions[s] += tasks[i]

                    if dfs(i + 1):
                        return True

                    sessions[s] -= tasks[i]
                    if sessions[s] == 0:
                        return False

                return False

            return dfs(0)

        lo = 1  # all tasks fit in 1 session
        hi = len(tasks)  # each task takes 1 session
        res = hi

        while lo <= hi:
            mid = (lo + hi) // 2

            if feasibility(mid):
                res = mid
                hi = mid - 1
            else:
                lo = mid + 1

        return res
