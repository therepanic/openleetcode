impl Solution {
    pub fn filter_restaurants(restaurants: Vec<Vec<i32>>, vegan_friendly: i32, max_price: i32, max_distance: i32) -> Vec<i32> {
        let mut restaurants_filtered: Vec<Vec<i32>> = Vec::new();

        for restaurant in &restaurants {
            if vegan_friendly == 1 && restaurant[2] != 1 {
                continue;
            }
            
            if restaurant[3] > max_price {
                continue;
            }

            if restaurant[4] > max_distance {
                continue;
            }

            restaurants_filtered.push(vec![restaurant[1], restaurant[0]]);
        }

        restaurants_filtered.sort_by(|a, b| {
            b[0].cmp(&a[0]).then(b[1].cmp(&a[1]))
        });

        let mut result: Vec<i32> = Vec::new();

        for restaurant in &restaurants_filtered {
            result.push(restaurant[1]);
        }

        result
    }
}
