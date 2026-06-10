#![allow(non_snake_case)]

pub struct Solution;

use std::time::Instant;
use std::rc::Rc;
use std::cell::RefCell;
use std::collections::*;
use std::fs;

${IMPORTS}

fn main() {
    let _TEST_ = load_test_data("test.json");
    ${INSERTION}
}

${SOLUTION}

${UTILITIES}
