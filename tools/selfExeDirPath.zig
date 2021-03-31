const std = @import("std");
const selfExeDirPath = std.fs.selfExeDirPath;
const print = std.debug.print;

pub fn main() anyerror!void {
    var buf: [4096]u8 = undefined;
    const selfPath = try selfExeDirPath(&buf);
    print("Executable folder: {s}", .{selfPath});
}

// EOF
