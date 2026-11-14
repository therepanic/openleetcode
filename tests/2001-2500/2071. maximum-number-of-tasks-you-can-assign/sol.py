class Solution(object):
    def maxTaskAssign(self, tasks, workers, pills, strength):
        tasks.sort()
        workers.sort()
        left, right = 0, min(len(tasks), len(workers))

        while left < right:
            mid = (left + right + 1)//2
            usedPills = 0
            avail = workers[-mid:]            
            canAssign = True

            for t in reversed(tasks[:mid]):
                if avail[-1] >= t:
                    avail.pop()
                else:
                    idx = bisect.bisect_left(avail, t - strength)
                    if idx == len(avail) or usedPills == pills:
                        canAssign = False
                        break
                    usedPills += 1
                    avail.pop(idx)

            if canAssign:
                left = mid
            else:
                right = mid - 1

        return left