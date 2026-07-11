class Solution:
    def videoStitching(self, clips: List[List[int]], time: int) -> int:
        clips.sort(key=lambda x: x[0])
        end = 0
        farthest = 0
        res = 0
        i = 0
        while farthest < time:
            prev_farthest = farthest
            while i < len(clips) and clips[i][0] <= end:
                farthest = max(farthest, clips[i][1])
                i += 1
            if farthest == prev_farthest:
                return -1
            end = farthest
            res += 1
        return res
