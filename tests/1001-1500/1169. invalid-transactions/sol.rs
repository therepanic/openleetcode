impl Solution {
    pub fn invalid_transactions(transactions: Vec<String>) -> Vec<String> {
        use std::collections::{HashMap, HashSet};

        let mut user_txns: HashMap<String, Vec<Vec<String>>> = HashMap::new();
        let mut invalids: Vec<String> = Vec::new();

        for txn in &transactions {
            let vals: Vec<String> = txn.split(',').map(|s| s.to_string()).collect();
            user_txns
                .entry(vals[0].clone())
                .or_insert_with(Vec::new)
                .push(vals);
        }

        for (_, mut txns) in user_txns {
            txns.sort_by_key(|x| x[1].parse::<i32>().unwrap());
            let mut cities: HashMap<String, i32> = HashMap::new();
            let mut l = 0;
            let mut invalid_txn_within_window: HashSet<usize> = HashSet::new();

            for r in 0..txns.len() {
                *cities.entry(txns[r][3].clone()).or_insert(0) += 1;
                while l < r {
                    let time_r: i32 = txns[r][1].parse().unwrap();
                    let time_l: i32 = txns[l][1].parse().unwrap();
                    if time_r - time_l <= 60 {
                        break;
                    }
                    *cities.get_mut(&txns[l][3]).unwrap() -= 1;
                    if cities[&txns[l][3]] == 0 {
                        cities.remove(&txns[l][3]);
                    }
                    invalid_txn_within_window.remove(&l);
                    l += 1;
                }

                let amount: i32 = txns[r][2].parse().unwrap();
                if amount > 1000 {
                    invalids.push(txns[r].join(","));
                }
                if cities.len() > 1 {
                    for i in l..=r {
                        let amt: i32 = txns[i][2].parse().unwrap();
                        if amt <= 1000 && !invalid_txn_within_window.contains(&i) {
                            invalids.push(txns[i].join(","));
                            invalid_txn_within_window.insert(i);
                        }
                    }
                }
            }
        }

        invalids
    }
}
