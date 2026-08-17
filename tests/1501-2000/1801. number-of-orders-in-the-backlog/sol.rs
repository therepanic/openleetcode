use std::collections::BinaryHeap;
use std::cmp::Reverse;

impl Solution {
    pub fn get_number_of_backlog_orders(orders: Vec<Vec<i32>>) -> i32 {
        let mut buy: BinaryHeap<(i32, i32)> = BinaryHeap::new();
        let mut sell: BinaryHeap<Reverse<(i32, i32)>> = BinaryHeap::new();
        for order in &orders {
            let price = order[0];
            let mut amount = order[1];
            let order_type = order[2];
            if order_type == 0 {
                while !sell.is_empty() && sell.peek().unwrap().0.0 <= price {
                    let s = sell.pop().unwrap().0;
                    if amount >= s.1 {
                        amount -= s.1;
                    } else {
                        sell.push(Reverse((s.0, s.1 - amount)));
                        amount = 0;
                        break;
                    }
                }
            } else {
                while !buy.is_empty() && buy.peek().unwrap().0 >= price {
                    let b = buy.pop().unwrap();
                    if amount >= b.1 {
                        amount -= b.1;
                    } else {
                        buy.push((b.0, b.1 - amount));
                        amount = 0;
                        break;
                    }
                }
            }
            if amount > 0 {
                if order_type == 0 {
                    buy.push((price, amount));
                } else {
                    sell.push(Reverse((price, amount)));
                }
            }
        }
        let res: i64 = buy.iter().map(|x| x.1 as i64).sum::<i64>() + sell.iter().map(|x| x.0.1 as i64).sum::<i64>();
        (res % 1_000_000_007) as i32
    }
}
