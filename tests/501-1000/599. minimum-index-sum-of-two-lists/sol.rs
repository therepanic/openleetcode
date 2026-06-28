impl Solution {
    pub fn find_restaurant(list1: Vec<String>, list2: Vec<String>) -> Vec<String> {
        use std::collections::HashMap;
        let mut mp: HashMap<String, i32> = HashMap::new();
        mp.insert(list1[0].clone(), i32::MIN);
        for i in 1..list1.len() {
            mp.insert(list1[i].clone(), -(i as i32));
        }
        if !mp.contains_key(&list2[0]) {
            mp.insert(list2[0].clone(), i32::MIN);
        } else {
            let val = *mp.get(&list2[0]).unwrap();
            if val != i32::MIN {
                mp.insert(list2[0].clone(), val.abs());
            } else {
                mp.insert(list2[0].clone(), 0);
            }
        }
        for i in 1..list2.len() {
            if mp.contains_key(&list2[i]) {
                let val = *mp.get(&list2[i]).unwrap();
                if val != i32::MIN {
                    mp.insert(list2[i].clone(), val.abs() + i as i32);
                } else {
                    mp.insert(list2[i].clone(), i as i32);
                }
            } else {
                mp.insert(list2[i].clone(), -(i as i32));
            }
        }
        let mut min_val = i32::MAX;
        for &v in mp.values() {
            if v >= 0 && v < min_val {
                min_val = v;
            }
        }
        let mut ans: Vec<String> = Vec::new();
        for (k, &v) in &mp {
            if v >= 0 && v == min_val {
                ans.push(k.clone());
            }
        }
        ans
    }
}
