from collections import deque, Counter
from typing import List


class Solution:
    def watchedVideosByFriends(
        self,
        watchedVideos: List[List[str]],
        friends: List[List[int]],
        id: int,
        level: int,
    ) -> List[str]:
        n = len(friends)

        visited = [False] * n
        q = deque([(id, 0)])
        visited[id] = True

        target_people = []

        while q:
            person, dist = q.popleft()

            if dist == level:
                target_people.append(person)
                continue

            for f in friends[person]:
                if not visited[f]:
                    visited[f] = True
                    q.append((f, dist + 1))

        freq = Counter()
        for p in target_people:
            for vid in watchedVideos[p]:
                freq[vid] += 1

        return sorted(freq.keys(), key=lambda x: (freq[x], x))
