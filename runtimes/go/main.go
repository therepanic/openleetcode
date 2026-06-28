package main

import (
	"encoding/json"
	"bytes"
	"container/heap"
	"container/list"
	"container/ring"
	"fmt"
	"math"
	"math/bits"
	"math/rand"
	"os"
	"regexp"
	"maps"
	"slices"
	"sort"
	"strconv"
	"reflect"
	"strings"
	"time"
	"unsafe"
	"unicode"
	"unicode/utf8"
)

${SOLUTION}

${UTILITIES}

var (
	_ = bytes.MinRead
	_ = heap.Init
	_ = list.New
	_ = ring.New
	_ = math.MaxInt
	_ = bits.Add
	_ = rand.Int
	_ = regexp.MustCompile
	_ = maps.Clone[map[int]int, int, int]
	_ = slices.Sort[[]int, int]
	_ = sort.Ints
	_ = strconv.IntSize
	_ = unicode.MaxRune
	_ = utf8.RuneSelf
)

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
