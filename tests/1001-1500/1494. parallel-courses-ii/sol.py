from collections import defaultdict
from functools import lru_cache
from typing import List
from itertools import combinations  # for picking k of n


class Solution:
    @lru_cache(None)  # caching for faster lookups
    def recurse(self, mask, in_degrees):
        # if all the bits are 0, we have taken all the courses
        if not mask:
            return 0

        # all the nodes that *can* be taken now, following both the properties
        nodes = [i for i in range(self.n) if mask & 1 << i and in_degrees[i] == 0]

        ans = float("inf")
        # enumerating all the possible combinations
        for k_nodes in combinations(nodes, min(self.k, len(nodes))):
            new_mask, new_in_degrees = mask, list(in_degrees)

            # updating what would happen to new_mask and new_in_degrees
            # if we considered the nodes in k_nodes
            for node in k_nodes:
                # since we know the bit is set, we un-set this bit, to mark it "considered"
                new_mask ^= 1 << node
                # updating each of the in-degrees, since the "parents" have been taken away
                for child in self.graph[node]:
                    new_in_degrees[child] -= 1

            # the heart of recursion
            # note the +1!
            ans = min(ans, 1 + self.recurse(new_mask, tuple(new_in_degrees)))
        return ans

    def minNumberOfSemesters(self, n: int, relations: List[List[int]], k: int) -> int:
        # saving n and k for later use
        self.n = n
        self.k = k
        in_degrees = [0] * self.n
        # graph layout remains the same, although the in_degrees change.
        # This allows us to keep graph as self.graph
        # instead of passing it over and over.
        self.graph = defaultdict(list)
        for prev_course, next_course in relations:
            # remember, its 0-indexed now!
            in_degrees[next_course - 1] += 1
            self.graph[prev_course - 1].append(next_course - 1)

        # start with all the bits set
        return self.recurse((1 << self.n) - 1, tuple(in_degrees))
