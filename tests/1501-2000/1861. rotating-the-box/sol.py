class Solution:
    def rotateTheBox(self, boxGrid: List[List[str]]) -> List[List[str]]:
        box = boxGrid
        r, c = len(box), len(box[0])
        rotate = [["."] * r for _ in range(c)]
        for i, row in enumerate(box):
            bottom = c - 1
            for j in range(c - 1, -1, -1):
                if row[j] == "#":
                    rotate[bottom][r - 1 - i] = "#"
                    bottom -= 1
                elif row[j] == "*":
                    rotate[j][r - 1 - i] = "*"
                    bottom = j - 1
        return rotate
