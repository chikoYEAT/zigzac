const std = @import("std");

test "definedx" {
    @setRuntimeSafety(false);
    var x: u8 = 255;
    x += 1; // xxx undefined behavior!
    std.debug.print("Hello Wrld\n", .{});
}