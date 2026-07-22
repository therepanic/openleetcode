impl Solution {
    pub fn display_table(orders: Vec<Vec<String>>) -> Vec<Vec<String>> {
        use std::collections::{BTreeSet, HashMap, BTreeMap};
        
        let mut food_items = BTreeSet::new();
        let mut table_orders: BTreeMap<i32, HashMap<String, i32>> = BTreeMap::new();

        for order in &orders {
            let table: i32 = order[1].parse().unwrap();
            let food = &order[2];
            food_items.insert(food.clone());
            table_orders.entry(table)
                .or_insert_with(HashMap::new)
                .entry(food.clone())
                .and_modify(|e| *e += 1)
                .or_insert(1);
        }

        let sorted_food_items: Vec<String> = food_items.into_iter().collect();
        let mut header = vec!["Table".to_string()];
        header.extend(sorted_food_items.clone());

        let mut result = vec![header];

        for (table, food_map) in &table_orders {
            let mut row = vec![table.to_string()];
            for food in &sorted_food_items {
                row.push(food_map.get(food).unwrap_or(&0).to_string());
            }
            result.push(row);
        }

        result
    }
}
