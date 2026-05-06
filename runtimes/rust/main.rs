pub struct Solution;

use std::rc::Rc;
use std::cell::RefCell;
use std::collections::VecDeque;

${IMPORTS}

fn main() {
    let result = ${CALL_SOLUTION};
    println!("{}", to_json(&result));
}

${SOLUTION}

${UTILITIES}
