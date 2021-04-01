const std = @import("std");
const cwd = std.fs.cwd;

fn writeStringToFile(filename: []const u8, content: []const u8) anyerror!void {
    const file = try cwd().createFile(filename, .{ .read = true });
    defer file.close();
    const bytes_written = try file.writeAll(content);
}

pub fn main() anyerror!void {
    try writeStringToFile("test.txt", "test content");
}
