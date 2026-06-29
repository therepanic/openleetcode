import * as fs from "fs";
import * as __lodash_runtime from "lodash";
void __lodash_runtime;

type _TEST_INPUT_ = { val: any };
const _TEST_: Record<string, Record<string, _TEST_INPUT_>> = JSON.parse(
  fs.readFileSync("test.json", "utf8")
);

function testVal(caseId: string, name: string): any {
  return _TEST_[caseId][name].val;
}

${SOLUTION}

${UTILITIES}

${INSERTION}
