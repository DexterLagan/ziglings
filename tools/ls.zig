const std = @import("std");
const print = std.debug.print;

// PS C:\Users\dexte> ls

//     Directory: C:\Users\dexte

// Mode                 LastWriteTime         Length Name
// ----                 -------------         ------ ----
// d-r---         3/26/2021   5:15 PM                3D Objects
// d-----         3/26/2021   9:59 PM                Apps
// d-r---         3/26/2021   5:15 PM                Contacts
// d-----         3/26/2021   5:20 PM                Documents
// d-r---         3/29/2021  12:32 AM                Downloads
// d-r---         3/26/2021   5:15 PM                Favorites
// d-r---         3/26/2021   5:15 PM                Links
// d-r---         3/26/2021   5:15 PM                Music
// dar--l          4/1/2021   9:10 AM                OneDrive
// d-r---         3/26/2021   5:15 PM                Saved Games
// d-r---         3/26/2021   5:16 PM                Searches
// d-r---          4/1/2021   9:13 AM                Videos

pub fn main() anyerror!void {
    var entry_count: usize = 0;
    const dir = try std.fs.cwd().openDir(".", .{ .iterate = true });
    var iter = dir.iterate();
    while (try iter.next()) |entry| {
        if (entry.kind == .File) {
            const file = try std.fs.cwd().openFile(entry.name, .{ .read = true });
            defer file.close();
            const stat = try file.stat();
            print("{s} - {}\n", .{ entry.name, stat.size });
        }
        entry_count += 1;
    }
    print("found {} files.\n", .{entry_count});
}
