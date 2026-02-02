# Comparison: C vs Ruby String Replacement Programs

## Developer Readability

| Aspect | C | Ruby |
|--------|---|------|
| **Lines of code** | 173 (across 3 files) | 83 (single file) |
| **Core logic** | 70 lines | 12 lines |
| **Boilerplate** | High (headers, memory mgmt, null terminators) | Minimal |

### C Readability Challenges
- Manual memory allocation/deallocation (`malloc`, `free`)
- Pointer arithmetic for string traversal
- Buffer size management (`MAX_INPUT_LEN`)
- Null terminator handling
- Multiple files required (`.c`, `.h`)

### Ruby Readability Advantages
- Core replacement is one line: `source.gsub(search, replace_str)`
- No memory management
- Built-in string methods (`scan`, `gsub`, `chomp!`)
- Single file, clear module structure

## Performance

| Metric | C | Ruby |
|--------|---|------|
| **Execution speed** | ~10-100x faster | Slower (interpreted) |
| **Memory control** | Precise, minimal allocation | GC-managed, higher overhead |
| **Startup time** | Near instant | ~50-100ms (interpreter load) |
| **Binary size** | ~35KB compiled | Requires Ruby runtime (~25MB) |

## When to Use Each

### Use C when:
- Building system-level software (OS, drivers, embedded)
- Performance is critical (real-time systems, game engines)
- Memory constraints are tight (IoT, microcontrollers)
- Creating libraries for other languages (FFI bindings)
- Processing millions of strings per second

### Use Ruby when:
- Rapid development and prototyping
- Web applications (Rails)
- Scripting and automation
- Developer productivity matters more than raw speed
- Team has limited systems programming experience
- Maintainability is a priority

## Recommendation

For this string replacement use case:
- **One-off scripts/tools**: Ruby (faster to write, easier to maintain)
- **High-throughput text processing**: C (if processing GB of data)
- **Part of larger application**: Match the existing stack
