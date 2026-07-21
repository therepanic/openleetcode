class Solution:
    def findSlope(self, diff2, diff1):
        return diff2 / diff1

    def checkStraightLine(self, coordinates):

        x1, y1 = coordinates[0]
        x2, y2 = coordinates[1]

        if x2 == x1:
            slope = float("inf")
        else:
            slope = self.findSlope(y2 - y1, x2 - x1)

        n = len(coordinates)

        for i in range(1, n - 1):
            x1, y1 = coordinates[i]
            x2, y2 = coordinates[i + 1]

            if x2 == x1:
                currSlope = float("inf")
            else:
                currSlope = self.findSlope(y2 - y1, x2 - x1)

            if currSlope != slope:
                return False

        return True
