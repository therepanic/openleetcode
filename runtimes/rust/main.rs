#![allow(non_snake_case)]

pub struct Solution;

use std::time::Instant;
use std::rc::Rc;
use std::cell::RefCell;
use std::cmp::{max as _max, min as _min, Ordering as _Ordering, Reverse as _Reverse};
use std::collections::*;
use std::fs;
use itertools::Itertools as _Itertools;
use rand::prelude as _rand_prelude;
use regex::Regex as _Regex;

${IMPORTS}

fn test_val(
    tests: &BTreeMap<String, BTreeMap<String, TestInput>>,
    case_id: &str,
    name: &str,
) -> JsonValue {
    tests[case_id][name].val.clone()
}

fn main() {
    let _TEST_ = load_test_data("test.json");
    ${INSERTION}
}

${SOLUTION}

${UTILITIES}
