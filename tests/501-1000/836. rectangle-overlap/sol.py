class Solution:
    def isRectangleOverlap(self, rec1, rec2):
        return not (
            rec1[2] <= rec2[0]  # rec1 is left of rec2
            or rec1[0] >= rec2[2]  # rec1 is right of rec2
            or rec1[3] <= rec2[1]  # rec1 is below rec2
            or rec1[1] >= rec2[3]  # rec1 is above rec2
        )
