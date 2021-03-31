// zig dexter's lib

const std = @import("std");

/// notes

// Display a variable's type:
// --------------------------
// std.debug.print("Type: {s}\n", .{@TypeOf(str)});

// Built-in functions:
// -------------------
// start with "@" just like the
// @import() function we've been using.

// Enumerate items for print:
// --------------------------
// Printing all RPG characters in a loop:
// for (chars) |c, num| {
//     std.debug.print("Character {} - G:{} H:{} XP:{}\n", .{
//         num + 1, c.gold, c.health, c.experience,
//     });
// }

// Pointers:
// ---------
//     var foo: u8 = 5;      // foo is 5
//     var bar: *u8 = &foo;  // bar is a pointer
//
// What is a pointer? It's a reference to a value. In this example
// bar is a reference to the memory space that currently contains the
// value 5.
//
// A cheatsheet given the above declarations:
//
//     u8         the type of a u8 value
//     foo        the value 5
//     *u8        the type of a pointer to a u8 value
//     &foo       a reference to foo
//     bar        a pointer to the value at foo
//     bar.*      the value 5 (the dereferenced value "at" bar)

// Pointers to structs:
// --------------------
//
//     const Vertex = struct{ x: u32, y: u32, z: u32 };
//     var v1 = Vertex{ .x=3, .y=2, .z=5 };
//     var pv: *Vertex = &v1;   // <-- a pointer to our struct
//
// Note that you don't need to dereference the "pv" pointer to access
// the struct's fields:
//
//     YES: pv.x
//     NO:  pv.*.x
//
// We can write functions that take pointer arguments:
//
//     fn foo(v: *Vertex) void {
//         v.x += 2;
//         v.y += 3;
//         v.z += 7;
//     }
//
// And pass references to them:
//
//     foo(&v1);

/// procs
fn echo(s: anytype) void {
    std.debug.print("{s}\n", .{s});
}

/// error handling template
const MyItemError = error{
    TooSmall,
    TooBig,
    TooGood,
};

const fileErr = error{FileNotFound};

// error handling proc
fn detect(n: u32) MyNumberError!u32 {
    if (n < 10) return MyNumberError.TooSmall;
    if (n > 20) return MyNumberError.TooBig;
    if (n == 20) return MyNumberError.TooGood;
    return n;
}

// error handling proc
fn detect(f: file) fileErr!u32 {
    if (f == null) return fileErr.FileNotFound;
    return f;
}

/// strings and slices
const scrambled = "great base for all your justice are belong to us";
const base1: []const u8 = scrambled[15..23];
// Zig string literals are immutable (const) values. So we need to change the type of slice:
fn printPhrase(part1: []const u8, part2: []const u8, part3: []const u8) void {
    std.debug.print("'{s} {s} {s}.' ", .{ part1, part2, part3 });
}

// Types:
//     var foo: [4]u8 = [4]u8{ 1, 2, 3, 4 };   - array
//     var foo_slice: []u8 = foo[0..];         - slice
//     var foo_ptr: [*]u8 = &foo;              - pointer array?

//     ZIG POINTER CHEATSHEET! (Using u8 as the example type.)
//   +---------------+----------------------------------------------+
//   |  u8           |  one u8                                      |
//   |  *u8          |  pointer to one u8                           |
//   |  [2]u8        |  two u8s                                     |
//   |  [*]u8        |  pointer to unknown number of u8s            |
//   |  [2]const u8  |  two immutable u8s                           |
//   |  [*]const u8  |  pointer to unknown number of immutable u8s  |
//   |  *[2]u8       |  pointer to an array of 2 u8s                |
//   |  *const [2]u8 |  pointer to an immutable array of 2 u8s      |
//   |  []u8         |  slice of u8s                                |
//   |  []const u8   |  slice of immutable u8s                      |
//   +---------------+----------------------------------------------+

/// strings can be slices of memory?
const zen12: *const [21]u8 = "Memory is a resource."; // pointer to an immutable array of 21 u8s
const zen_manyptr: [*]const u8 = zen12; // pointer to unknown number of immutable u8s (many-item pointer)
const zen12_string: []const u8 = zen_manyptr[0..21]; // slice of immutable u8s, of the size of the original array.

/// main
pub fn main() void {
    echo("NAICE!");
    std.debug.print("{s}\n", .{zen12_string});
}
