use std::collections::HashSet;

impl Solution {
    pub fn is_rectangle_cover(rectangles: Vec<Vec<i32>>) -> bool {
        let mut area: i64 = 0;
        let mut corners: HashSet<String> = HashSet::new();
        
        for rect in &rectangles {
            let (x, y, X, Y) = (rect[0], rect[1], rect[2], rect[3]);
            area += ((X - x) as i64) * ((Y - y) as i64);
            
            let p1 = format!("{},{}", x, y);
            let p2 = format!("{},{}", x, Y);
            let p3 = format!("{},{}", X, y);
            let p4 = format!("{},{}", X, Y);
            
            if !corners.insert(p1) { corners.remove(&format!("{},{}", x, y)); }
            if !corners.insert(p2) { corners.remove(&format!("{},{}", x, Y)); }
            if !corners.insert(p3) { corners.remove(&format!("{},{}", X, y)); }
            if !corners.insert(p4) { corners.remove(&format!("{},{}", X, Y)); }
        }
        
        if corners.len() != 4 { return false; }
        
        let mut min_x = i32::MAX;
        let mut min_y = i32::MAX;
        let mut max_x = i32::MIN;
        let mut max_y = i32::MIN;
        
        for point in &corners {
            let parts: Vec<&str> = point.split(',').collect();
            let x: i32 = parts[0].parse().unwrap();
            let y: i32 = parts[1].parse().unwrap();
            min_x = min_x.min(x);
            min_y = min_y.min(y);
            max_x = max_x.max(x);
            max_y = max_y.max(y);
        }
        
        ((max_x - min_x) as i64) * ((max_y - min_y) as i64) == area
    }

    #[allow(non_snake_case)]
    pub fn isRectangleCover(rectangles: Vec<Vec<i32>>) -> bool {
        Self::is_rectangle_cover(rectangles)
    }
}
