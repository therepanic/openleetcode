from collections import defaultdict, deque

class Solution:
    def findAllPeople(self, n, meet, fp):

        # Group meetings in increasing order of time
        timeMeetings = defaultdict(list)
        for x, y, t in meet:
            timeMeetings[t].append((x, y))

        # ks -> knows secret
        ks = [False] * n
        ks[0] = True
        ks[fp] = True

        for t in sorted(timeMeetings.keys()):
            meetings = timeMeetings[t]

            # Build adjacency list for time t only
            meetList = defaultdict(list)
            for x, y in meetings:
                meetList[x].append(y)
                meetList[y].append(x)

            # Find starting points
            start = set()
            for x, y in meetings:
                if ks[x]:
                    start.add(x)
                if ks[y]:
                    start.add(y)

            # BFS
            q = deque(start)
            while q:
                person = q.popleft()
                for nextPerson in meetList[person]:
                    if not ks[nextPerson]:
                        ks[nextPerson] = True
                        q.append(nextPerson)

        return [i for i in range(n) if ks[i]]