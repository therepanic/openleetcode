func toJson(obj interface{}) string {
    seen := make(map[uintptr]bool)
    return "\n" + encodeValue(reflect.ValueOf(obj), seen)
}

func encodeValue(v reflect.Value, seen map[uintptr]bool) string {
	for v.Kind() == reflect.Interface {
		if v.IsNil() {
			return "null"
		}
		v = v.Elem()
	}

	if v.Kind() == reflect.Ptr {
		if v.IsNil() {
			return "null"
		}
		v = v.Elem()
	}

	switch v.Kind() {
	case reflect.Invalid:
		return "null"
	case reflect.Bool:
		if v.Bool() {
			return "true"
		}
		return "false"
	case reflect.Int, reflect.Int8, reflect.Int16, reflect.Int32, reflect.Int64:
		return fmt.Sprintf("%d", v.Int())
	case reflect.Uint, reflect.Uint8, reflect.Uint16, reflect.Uint32, reflect.Uint64, reflect.Uintptr:
		return fmt.Sprintf("%d", v.Uint())
	case reflect.Float32, reflect.Float64:
		return fmt.Sprintf("%g", v.Float())
	case reflect.String:
		return jsonQuote(v.String())
	case reflect.Slice:
		if v.IsNil() {
			return "null"
		}
		if v.Type().Elem().Kind() == reflect.Uint8 {
			return jsonQuote(bytesHex(v.Bytes()))
		}
		return encodeArray(v, seen)
	case reflect.Array:
		return encodeArray(v, seen)
	case reflect.Map:
		if v.IsNil() {
			return "null"
		}
		return encodeMap(v, seen)
	case reflect.Struct:
		if t, ok := v.Interface().(time.Time); ok {
			return jsonQuote(t.Format(time.RFC3339Nano))
		}
		return encodeStruct(v, seen)
	}
	return jsonQuote(fmt.Sprintf("%v", v.Interface()))
}

func encodeArray(v reflect.Value, seen map[uintptr]bool) string {
	var sb strings.Builder
	sb.WriteByte('[')
	for i := 0; i < v.Len(); i++ {
		if i > 0 {
			sb.WriteByte(',')
		}
		sb.WriteString(encodeValue(v.Index(i), seen))
	}
	sb.WriteByte(']')
	return sb.String()
}

func encodeMap(v reflect.Value, seen map[uintptr]bool) string {
	ptr := v.Pointer()
	if seen[ptr] {
		panic("Cycle detected while encoding to json")
	}
	seen[ptr] = true
	defer delete(seen, ptr)

	var sb strings.Builder
	sb.WriteByte('{')
	first := true
	for _, k := range v.MapKeys() {
		if !first {
			sb.WriteByte(',')
		}
		first = false
		sb.WriteString(jsonQuote(fmt.Sprintf("%v", k.Interface())))
		sb.WriteByte(':')
		sb.WriteString(encodeValue(v.MapIndex(k), seen))
	}
	sb.WriteByte('}')
	return sb.String()
}

func encodeStruct(v reflect.Value, seen map[uintptr]bool) string {
	if v.CanAddr() {
		ptr := uintptr(unsafe.Pointer(v.UnsafeAddr()))
		if seen[ptr] {
			panic("Cycle detected while encoding to json")
		}
		seen[ptr] = true
		defer delete(seen, ptr)
	}

	var sb strings.Builder
	sb.WriteByte('{')
	first := true
	t := v.Type()
	for i := 0; i < t.NumField(); i++ {
		f := t.Field(i)
		if f.PkgPath != "" {
			continue
		}
		name := f.Name
		if strings.HasPrefix(name, "_") {
			continue
		}
		if tag, ok := f.Tag.Lookup("json"); ok {
			parts := strings.SplitN(tag, ",", 2)
			if parts[0] == "-" {
				continue
			}
			if parts[0] != "" {
				name = parts[0]
			}
		} else {
			name = strings.ToLower(name[:1]) + name[1:]
		}
		if !first {
			sb.WriteByte(',')
		}
		first = false
		sb.WriteString(jsonQuote(name))
		sb.WriteByte(':')
		sb.WriteString(encodeValue(v.Field(i), seen))
	}
	sb.WriteByte('}')
	return sb.String()
}

func jsonQuote(s string) string {
	var sb strings.Builder
	sb.WriteByte('"')
	for _, ch := range s {
		switch ch {
		case '"':
			sb.WriteString(`\"`)
		case '\\':
			sb.WriteString(`\\`)
		case '\b':
			sb.WriteString(`\b`)
		case '\f':
			sb.WriteString(`\f`)
		case '\n':
			sb.WriteString(`\n`)
		case '\r':
			sb.WriteString(`\r`)
		case '\t':
			sb.WriteString(`\t`)
		default:
			if ch < 0x20 {
				sb.WriteString(fmt.Sprintf(`\u%04x`, ch))
			} else {
				sb.WriteRune(ch)
			}
		}
	}
	sb.WriteByte('"')
	return sb.String()
}

func bytesHex(b []byte) string {
	var sb strings.Builder
	for _, c := range b {
		fmt.Fprintf(&sb, "%02x", c)
	}
	return sb.String()
}
