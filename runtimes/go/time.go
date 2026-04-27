package main

import (
    "fmt"
    "reflect"
    "strings"
    "time"
    "unsafe"
)

${SOLUTION}

${UTILITIES}

func main() {
    cur := time.Now().UnixNano() / 1_000_000
    ${CALL_SOLUTION}
    now := time.Now().UnixNano() / 1_000_000
    fmt.Print(now - cur)
}
