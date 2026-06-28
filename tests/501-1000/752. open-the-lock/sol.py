class Solution:
    def openLock(self, deadends: List[str], target: str) -> int:
        if target == "0000":
            return 0
        deadend_set = set(deadends)
        if "0000" in deadend_set:
            return -1

        moves = 0
        queue = deque(["0000"])
        visited = set(["0000"])

        def locker(lock):
            neighbors = []
            for i in range(4):
                val = int(lock[i])
                up = (val + 1) % 10  # +1 increment
                lock_up = lock[:i] + str(up) + lock[i + 1 :]
                down = (val - 1) % 10  # -1 decrement
                lock_down = lock[:i] + str(down) + lock[i + 1 :]
                neighbors.append(lock_up)
                neighbors.append(lock_down)
            return neighbors

        while queue:
            for _ in range(len(queue)):
                cur_lock = queue.popleft()
                if cur_lock == target:
                    return moves
                for new_lock in locker(cur_lock):
                    if new_lock not in deadend_set and new_lock not in visited:
                        visited.add(new_lock)
                        queue.append(new_lock)
            moves += 1
        return -1
