const std = @import("std");

// function reads a line off a reader and returns a string
fn readLine(reader: anytype, buffer: []u8) !?[]const u8 {
    var line: []const u8 = (try reader.readUntilDelimiterOrEof(buffer, '\n')) orelse return null;
    // trim windows carriage return
    if (std.builtin.Target.current.os.tag == .windows) {
        line = std.mem.trimRight(u8, line, "\r");
    }
    return line;
}

pub fn main() anyerror!void {
    const stdout = std.io.getStdOut();
    const stdin = std.io.getStdIn();

    try stdout.writeAll("Enter your name: ");

    var buffer: [100]u8 = undefined;
    const input = (try readLine(stdin.reader(), &buffer)).?;
    try stdout.writer().print("Your name is: \"{s}\"\n", .{input});
}

// EOF