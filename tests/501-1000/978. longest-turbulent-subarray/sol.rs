impl Solution {
    pub fn max_turbulence_size(arr: Vec<i32>) -> i32 {
        let n = arr.len();
        if n < 2 {
            return n as i32;
        }

        let mut ans = 1;
        let mut anchor = 0;

        let compare = |x: i32, y: i32| -> i32 {
            if x < y { -1 }
            else if x > y { 1 }
            else { 0 }
        };

        for i in 1..n {
            let c = compare(arr[i - 1], arr[i]);
            if c == 0 {
                anchor = i;
            } else {
                if i == n - 1 || c * compare(arr[i], arr[i + 1]) != -1 {
                    ans = ans.max((i - anchor + 1) as i32);
                    anchor = i;
                }
            }
        }
        ans
    }
}
