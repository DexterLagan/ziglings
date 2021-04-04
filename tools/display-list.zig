const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    // testing array of strings - an array of arrays of characters, of inferred size
    // this is valid: const a: [3][]const u8 = [_][]const u8{ "naice", "string", "buddy" };
    // but can be written with inferred size:
    const a = [_][]const u8{ "naice", "string", "buddy" };
    for (a) |str| {
        print("{s}\n", .{str});
    }
}

// EOF
