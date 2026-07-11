impl Solution {
    pub fn parse_bool_expr(expression: String) -> bool {
        let mut st: Vec<Vec<Box<dyn std::any::Any>>> = vec![vec![]];
        for ch in expression.chars() {
            match ch {
                '&' => st.push(vec![Box::new("&".to_string())]),
                '|' => st.push(vec![Box::new("|".to_string())]),
                '!' => st.push(vec![Box::new("!".to_string())]),
                't' => {
                    let top = st.last_mut().unwrap();
                    top.push(Box::new(true));
                }
                'f' => {
                    let top = st.last_mut().unwrap();
                    top.push(Box::new(false));
                }
                ')' => {
                    let mut popped = st.pop().unwrap();
                    let op = popped.remove(0).downcast::<String>().unwrap();
                    let top = st.last_mut().unwrap();
                    match op.as_str() {
                        "&" => {
                            let res = popped.iter().all(|v| *v.downcast_ref::<bool>().unwrap());
                            top.push(Box::new(res));
                        }
                        "|" => {
                            let res = popped.iter().any(|v| *v.downcast_ref::<bool>().unwrap());
                            top.push(Box::new(res));
                        }
                        "!" => {
                            let res = !*popped[0].downcast_ref::<bool>().unwrap();
                            top.push(Box::new(res));
                        }
                        _ => {}
                    }
                }
                _ => {}
            }
        }
        *st[0][0].downcast_ref::<bool>().unwrap()
    }
}
