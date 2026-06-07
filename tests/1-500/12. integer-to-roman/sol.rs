impl Solution {
    pub fn int_to_roman(num: i32) -> String {
        let m = ["", "M", "MM", "MMM"];
        let c = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"];
        let x = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"];
        let i = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"];
        format!("{}{}{}{}", m[(num / 1000) as usize], c[((num % 1000) / 100) as usize], x[((num % 100) / 10) as usize], i[(num % 10) as usize])
    }
}
