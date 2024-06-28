const std = @import("std");
const a: i32 = 5;

var b: u32 = 324;
var c: i64 = undefined;


const d = [6]u8{1,2,3,4,5,6};
const e = [_]u8{1,2,3,4,5};

const length = d.len;
const width = e.len;

pub fn main() void {
    std.debug.print("{d}\n",.{length});
    std.debug.print("{d}\n",.{width});
    std.debug.print("And.. The number is: {d}\n", .{a});
    std.debug.print("{d}\n",.{c});
}

