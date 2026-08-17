from itertools import permutations


class Solution(object):
    def maxCompatibilitySum(self, students, mentors):
        """
        :type students: List[List[int]]
        :type mentors: List[List[int]]
        :rtype: int
        """

        def score(a, b):
            return sum(x == y for x, y in zip(a, b))

        m = len(students)
        max_score = 0

        for perm in permutations(range(m)):
            total = 0
            for i in range(m):
                total += score(students[i], mentors[perm[i]])
            max_score = max(max_score, total)

        return max_score
