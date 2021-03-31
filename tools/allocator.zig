const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

test "allocation" {
    const allocator = std.heap.page_allocator;

    const memory = try allocator.alloc(u8, 100);
    defer allocator.free(memory);

    expect(memory.len == 100);
    expect(@TypeOf(memory) == []u8);
}

pub fn main() anyerror!void {
    // testing array of chars
    const s = "some string";
    for (s) |chr| {
        print("Character: {c}\n", .{chr});
    }

    // testing array of strings - an array of arrays of characters, of inferred size
    // this is valid: const a: [3][]const u8 = [_][]const u8{ "naice", "string", "buddy" };
    // but can be written with inferred size:
    const a = [_][]const u8{ "naice", "string", "buddy" };
    for (a) |str| {
        print("String: {s}\n", .{str});
    }

    // allocator
    const allo = std.heap.page_allocator; // get an allocator;
    const mem = try allo.alloc(u8, 100);  // allocate 100 bytes of RAM on the heap;
    defer allo.free(mem);                 // defer freeing that RAM;

    

}

// EOF
