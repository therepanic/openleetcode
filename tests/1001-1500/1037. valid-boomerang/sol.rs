impl Solution {
    pub fn is_boomerang(points: Vec<Vec<i32>>) -> bool {
        let x1=points[0][0];
        let y1=points[0][1];
        let x2=points[1][0];
        let y2=points[1][1];
        let x3=points[2][0];
        let y3=points[2][1];
        if (y2-y1)*(x3-x2)==(y3-y2)*(x2-x1) {
            return false;
        }
        return true;
    }
}
