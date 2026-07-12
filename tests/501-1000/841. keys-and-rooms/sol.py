from collections import deque
from typing import List


class Solution:
    def canVisitAllRooms(self, rooms: List[List[int]]) -> bool:
        n = len(rooms)
        key = deque([0])
        visited = {0}
        while len(key) != 0:
            room = key.popleft()
            for i in rooms[room]:
                if i not in visited:
                    visited.add(i)
                    key.append(i)
        return len(visited) == n
