from collections import deque


class Solution:
    def boxDelivering(
        self, boxes: list[list[int]], portsCount: int, maxBoxes: int, maxWeight: int
    ) -> int:
        n = len(boxes)
        ports = [0] * (n + 1)
        weights = [0] * (n + 1)
        for i, (p, w) in enumerate(boxes, 1):
            ports[i] = p
            weights[i] = w
        prefixWeights = [0] * (n + 1)
        for i in range(1, n + 1):
            prefixWeights[i] = prefixWeights[i - 1] + weights[i]
        portsCnt = [0] * (n + 2)
        for i in range(2, n + 1):
            portsCnt[i] = portsCnt[i - 1] + (ports[i] != ports[i - 1])
        portsCnt[n + 1] = portsCnt[n]
        dp = [0] * (n + 1)
        queue = deque([0])
        left = 0
        for i in range(1, n + 1):
            while (
                i - left > maxBoxes
                or prefixWeights[i] - prefixWeights[left] > maxWeight
            ):
                if queue and queue[0] == left:
                    queue.popleft()
                left += 1
            dp[i] = 2 + portsCnt[i] + (dp[queue[0]] - portsCnt[queue[0] + 1])
            idx = dp[i] - portsCnt[i + 1]
            while queue and (dp[queue[-1]] - portsCnt[queue[-1] + 1]) >= idx:
                queue.pop()
            queue.append(i)
        return dp[n]
