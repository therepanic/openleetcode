class Solution(object):
    def numTilePossibilities(self, tiles):
        tiles = sorted(tiles)
        used = [False] * len(tiles)
        return self.backtrack(tiles, used)

    def backtrack(self, tiles, used):
        count = 0
        for i in range(len(tiles)):
            if used[i] or (i > 0 and tiles[i] == tiles[i - 1] and not used[i - 1]):
                continue
            used[i] = True
            count += 1 + self.backtrack(tiles, used)
            used[i] = False
        return count
