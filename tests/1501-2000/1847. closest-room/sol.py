class Solution:
    def closestRoom(self, rooms, queries):
        rooms = sorted(rooms, key=lambda x: x[1], reverse=True)
        indexed = sorted(enumerate(queries), key=lambda x: x[1][1], reverse=True)
        from sortedcontainers import SortedList

        active = SortedList()
        result = [-1] * len(queries)

        for qi, (preferred, minimum) in indexed:
            while rooms and rooms[0][1] >= minimum:
                active.add(rooms.pop(0)[0])
            pos = active.bisect_left(preferred)
            candidates = []
            if pos < len(active):
                candidates.append(active[pos])
            if pos:
                candidates.append(active[pos - 1])
            if candidates:
                result[qi] = min(
                    candidates, key=lambda room_id: (abs(room_id - preferred), room_id)
                )
        return result
