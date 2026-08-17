class Solution(object):
    def squareIsWhite(self, coordinates):
        return (ord(coordinates[0]) - int(coordinates[1])) % 2 != 0
