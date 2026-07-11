impl Solution {
    pub fn video_stitching(clips: Vec<Vec<i32>>, time: i32) -> i32 {
        let mut clips = clips;
        clips.sort_by(|a, b| a[0].cmp(&b[0]));
        let mut end = 0;
        let mut farthest = 0;
        let mut res = 0;
        let mut i = 0;
        while farthest < time {
            let prev_farthest = farthest;
            while i < clips.len() && clips[i][0] <= end {
                farthest = farthest.max(clips[i][1]);
                i += 1;
            }
            if farthest == prev_farthest {
                return -1;
            }
            end = farthest;
            res += 1;
        }
        res
    }
}
