# @param {Integer[][]} clips
# @param {Integer} time
# @return {Integer}
def video_stitching(clips, time)
    clips.sort_by! { |c| c[0] }
    end_val = 0
    farthest = 0
    res = 0
    i = 0
    while farthest < time
        prev_farthest = farthest
        while i < clips.length && clips[i][0] <= end_val
            farthest = [farthest, clips[i][1]].max
            i += 1
        end
        if farthest == prev_farthest
            return -1
        end
        end_val = farthest
        res += 1
    end
    res
end
