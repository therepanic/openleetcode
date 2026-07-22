class Solution:
    def canReach(self, arr, start):
        seen = set()
        queue = [start]
        head = 0
        while head < len(queue):
            index = queue[head]
            head += 1
            if index < 0 or index >= len(arr) or index in seen:
                continue
            if arr[index] == 0:
                return True
            seen.add(index)
            queue.append(index + arr[index])
            queue.append(index - arr[index])
        return False
