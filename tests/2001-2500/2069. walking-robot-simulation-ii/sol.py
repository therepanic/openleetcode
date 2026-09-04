class Solution:
    # Added using AI
    class Robot:
        def __init__(self, width: int, height: int):
            self.x = 0
            self.y = 0
            self.dir = "East"
            self.width = width
            self.height = height

        def step(self, num: int) -> None:
            perim = 2 * (self.width - 1) + 2 * (self.height - 1)
            num %= perim
            if num == 0:
                num = perim

            while num > 0:
                if self.dir == "East":
                    maxX = min(self.x + num, self.width - 1)
                    rem  = num - (maxX - self.x)
                    num  = rem
                    if rem == 0: self.x = maxX
                    else:        self.x = maxX; self.dir = "North"
                elif self.dir == "West":
                    minX = max(self.x - num, 0)
                    rem  = num - (self.x - minX)
                    num  = rem
                    if rem == 0: self.x = minX
                    else:        self.x = minX; self.dir = "South"
                elif self.dir == "North":
                    maxY = min(self.y + num, self.height - 1)
                    rem  = num - (maxY - self.y)
                    num  = rem
                    if rem == 0: self.y = maxY
                    else:        self.y = maxY; self.dir = "West"
                elif self.dir == "South":
                    minY = max(self.y - num, 0)
                    rem  = num - (self.y - minY)
                    num  = rem
                    if rem == 0: self.y = minY
                    else:        self.y = minY; self.dir = "East"

        def getPos(self): return [self.x, self.y]
        def getDir(self): return self.dir
