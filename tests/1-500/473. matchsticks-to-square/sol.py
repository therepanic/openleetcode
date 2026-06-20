class Solution(object):
    def makesquare(self, matchsticks):
        total = sum(matchsticks)
        if total % 4 != 0:
            return False
        side = total // 4
        matchsticks.sort(reverse=True)
        n = len(matchsticks)

        def backtrack(index, sides):
            if index == n:
                return all(s == side for s in sides)
            for i in range(4):
                if sides[i] + matchsticks[index] <= side:
                    sides[i] += matchsticks[index]
                    if backtrack(index + 1, sides):
                        return True
                    sides[i] -= matchsticks[index]
            return False

        return backtrack(0, [0, 0, 0, 0])
