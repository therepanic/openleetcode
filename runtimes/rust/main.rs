pub struct Solution;

use std::time::Instant;
use std::rc::Rc;
use std::cell::RefCell;
use std::collections::*;
use std::fs;

${IMPORTS}

fn test_val<'a>(test: &'a BTreeMap<String, BTreeMap<String, TestInput>>, case_id: &str, name: &str) -> &'a JsonValue {
    &test[case_id][name].val
}

fn main() {
    let _TEST_ = load_test_data("test.json");
    ${INSERTION}
}

${SOLUTION}

${UTILITIES}
