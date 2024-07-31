const std = @import("std");

test "expectEqual demo" {
    const expected: i32 = 42;
    const actual = 42;
    try std.testing.expectEqual(expected, actual);
}

test "expectError demo" {
    const expected_error = error.DivideByZero;
    const actual_error_union: anyerror!void  = error.DivideByZero; 
    try std.testing.expectError(expected_error, actual_error_union);
}