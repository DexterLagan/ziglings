# Ziglings

Ziglings I completed, kept as programming notes while learning [Zig](https://ziglang.org/).

![ziglings](https://user-images.githubusercontent.com/1458409/109398392-c1069500-790a-11eb-8ed4-7d7d74d32666.jpg)

## How to install

Install a [development build](https://ziglang.org/download/) of the Zig compiler.
(See the "master" section of the downloads page.)

Verify the installation and build number of `zig` like so:

```bash
$ zig version
0.8.0-dev.1065+xxxxxxxxx
```

Clone this repository with Git:

```bash
$ git clone https://github.com/ratfactor/ziglings
$ cd ziglings
```

Then run `zig build` and follow the instructions to begin!

```bash
$ zig build
```

## Advanced Usage

It can be handy to check just a single exercise or _start_ from a single
exercise:

```bash
zig build 19
zig build 19_start
```

You can also run without checking for correctness:

```bash
zig build 19_test
```

Or skip the build system entirely and interact directly with the compiler
if you're into that sort of thing:

```bash
zig run exercises/001_hello.zig
```

Calling all wizards: To prepare an executable for debugging, install it
to zig-cache/bin with:

```bash
zig build 19_install
```

## Done so far

* [x] Hello world (main needs to be public)
* [x] Importing standard library
* [x] Assignment
* [x] Arrays
* [x] Strings
* [x] If
* [x] While
* [x] For
* [x] Functions
* [x] Errors (error/try/catch/if-else-err)
* [x] Defer (and errdefer)
* [x] Switch
* [x] Unreachable
* [x] Enums
* [x] Structs
* [x] Pointers
* [x] Optionals
* [x] Struct methods
* [x] Slices
* [x] Many-item pointers
* [x] Unions
* [ ] Numeric types (integers, floats)
* [ ] Labelled blocks and loops
* [ ] Loops as expressions
* [ ] Comptime
* [ ] Inline loops (how to DEMO this?)
* [ ] Anonymous structs
* [ ] Sentinel termination
* [ ] Vectors
* [ ] Imports
* [ ] Allocators
* [ ] Arraylist
* [ ] Filesystem
* [ ] Readers and Writers
* [ ] Formatting
* [ ] JSON
* [ ] Random Numbers
* [ ] Crypto
* [ ] Threads
* [ ] Hash Maps
* [ ] Stacks
* [ ] Sorting
* [ ] Iterators
* [ ] Formatting specifiers
* [ ] Advanced Formatting
* [ ] Suspend / Resume
* [ ] Async / Await
* [ ] Nosuspend
* [ ] Async Frames, Suspend Blocks

The initial topics for these exercises were unabashedly cribbed from
[ziglearn.org](https://ziglearn.org/). I've since moved things around
in an order that I think best lets each topic build upon each other.
