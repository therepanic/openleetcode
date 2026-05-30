package main

import (
	"encoding/json"
	"fmt"
	"os"
	"time"
	"strings"
	"reflect"
	"unsafe"
)

${SOLUTION}

${UTILITIES}

type _TestInput struct {
	Val interface{} `json:"val"`
}

var _TEST_ map[string]map[string]_TestInput

func testVal(caseId string, name string) interface{} {
	return _TEST_[caseId][name].Val
}

func main() {
	raw, err := os.ReadFile("test.json")
	if err != nil {
		panic(err)
	}
	if err := json.Unmarshal(raw, &_TEST_); err != nil {
		panic(err)
	}
	${INSERTION}
}
