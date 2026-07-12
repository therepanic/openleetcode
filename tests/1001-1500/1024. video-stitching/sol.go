func videoStitching(clips [][]int, time int) int {
    sort.Slice(clips, func(i, j int) bool {
        return clips[i][0] < clips[j][0]
    })
    end := 0
    farthest := 0
    res := 0
    i := 0
    for farthest < time {
        prevFarthest := farthest
        for i < len(clips) && clips[i][0] <= end {
            if clips[i][1] > farthest {
                farthest = clips[i][1]
            }
            i++
        }
        if farthest == prevFarthest {
            return -1
        }
        end = farthest
        res++
    }
    return res
}
