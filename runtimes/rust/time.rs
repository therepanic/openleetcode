pub struct Solution;

use std::time::Instant;
use std::rc::Rc;
use std::cell::RefCell;
use std::collections::VecDeque;

${IMPORTS}

fn main() {
    let start = Instant::now();
    let _ = ${CALL_SOLUTION};
    let duration = start.elapsed();
    println!("{}", duration.as_millis());
}

${SOLUTION}

${UTILITIES}
