impl Solution {
    pub fn count_vowel_strings(n: i32) -> i32 {
        if n==1{
            return 5;
        }else if n==2{
            return 15;
        }else if n==3{
            return 35;
        }
        let n=n as usize;
        let mut x:Vec<i32>=vec![0;n-2];
        x[0]=10;
        let mut c=5;
        for i in 0..n-3{
            x[i+1]=x[i]+c;
            c+=1;
        }
        let mut y:Vec<i32>=vec![0;n-1];
        y[0]=10;
        for i in 0..n-2{
            y[i+1]=y[i]+x[i];
        }
        let sum:i32=y.iter().sum();
        return sum+5;
    }
}
