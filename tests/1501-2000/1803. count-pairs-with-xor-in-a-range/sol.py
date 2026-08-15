class Solution:
    def countPairs(self, nums, low, high):
        bits = max(1, max(max(nums).bit_length(), (high + 1).bit_length()))

        def count_less(bound):
            if bound <= 0:
                return 0
            child = [[-1, -1]]
            counts = [0]
            total = 0
            for value in nums:
                node = 0
                for bit in range(bits - 1, -1, -1):
                    v = (value >> bit) & 1
                    b = (bound >> bit) & 1
                    if b:
                        same = child[node][v]
                        if same != -1:
                            total += counts[same]
                        nxt = child[node][1 - v]
                    else:
                        nxt = child[node][v]
                    if nxt == -1:
                        node = -1
                        break
                    node = nxt
                node = 0
                for bit in range(bits - 1, -1, -1):
                    v = (value >> bit) & 1
                    nxt = child[node][v]
                    if nxt == -1:
                        nxt = len(child)
                        child[node][v] = nxt
                        child.append([-1, -1])
                        counts.append(0)
                    node = nxt
                    counts[node] += 1
            return total

        return count_less(high + 1) - count_less(low)
