package main

import (
    "fmt"
    "reflect"
    "strings"
    "time"
    "unsafe"
)

${SOLUTION}

${JSON_GEN}

func main() {
    cur := time.Now().UnixMilli()
    ${CALL_SOLUTION}
    now := time.Now().UnixMilli()
    fmt.Print(now - cur)
}
