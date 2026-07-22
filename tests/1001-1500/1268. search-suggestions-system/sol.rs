impl Solution {
    pub fn suggested_products(mut products: Vec<String>, search_word: String) -> Vec<Vec<String>> {
        products.sort();
        let mut answer = Vec::new();
        let mut prefix = String::new();
        for ch in search_word.chars() {
            prefix.push(ch);
            answer.push(products.iter().filter(|product| product.starts_with(&prefix)).take(3).cloned().collect());
        }
        answer
    }
}
