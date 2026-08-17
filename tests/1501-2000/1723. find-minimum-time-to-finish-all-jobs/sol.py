class Solution:
    def minimumTimeRequired(self, jobs: List[int], k: int) -> int:
        # Sort the jobs in descending order
        jobs.sort(reverse=True)

        # Define binary search boundaries
        left, right = max(jobs), sum(jobs)

        def canDistribute(maxWorkload):
            # Track how many workers are used and their current workloads
            workers = [0] * k

            def assignJob(jobIndex):
                if jobIndex == len(jobs):
                    return True
                for i in range(k):
                    if workers[i] + jobs[jobIndex] <= maxWorkload:
                        workers[i] += jobs[jobIndex]
                        if assignJob(jobIndex + 1):
                            return True
                        workers[i] -= jobs[jobIndex]
                    # If this worker has no jobs assigned yet, break to avoid duplicates
                    if workers[i] == 0:
                        break
                return False

            return assignJob(0)

        # Binary search to find the minimum possible maximum workload
        while left < right:
            mid = (left + right) // 2
            if canDistribute(mid):
                right = mid
            else:
                left = mid + 1

        return left
