const std = @import("std");

test "definedx" {
    @setRuntimeSafety(false);
    var x: u8 = 255;
    x += 1; // xxx undefined behavior!
    std.debug.print("Hello Wrld\n", .{});
}

const expect = @import("std").testing.expect;

test "if statement" {
    const a = true;
    var x: u16 = 0;
    if (a) {
        x += 1;
    } else {
        x += 2;
    }
    try expect(x == 1);
    std.debug.print("{d}\n",.{x});
}

// same

test "if statement expression" {
    const a = true;
    var x: u16 = 0;
    x += if (a) 1 else 2;
    try expect(x == 1);
    std.debug.print("{d}\n",.{x});
}


test "while with continue" {
    var sum: u8 = 0;
    var i: u8 = 0;
    while (i <= 3) : (i += 1) {
        if (i == 2) continue;
        sum += i;
    }
    try expect(sum == 4);
    std.debug.print("{d}\n",.{sum});
}

const Result = union {
    int: i64,
    float: f64,
    bool: bool,
};

test "simple union" {
    var result = Result{ .int = 1234 };
    result = Result{.float = 12.34};
}


test "nested continue" {
    var count: usize = 0;
    outer: for ([_]i32{1,2,3,4,5,6,7,8,9}) |_| {                         // sliced
        for ([_]i32{1,2,3,4,5}) |_| {
            count += 1;   
            continue :outer;                        // recurssion
        }
    }
    std.debug.print("{d}\n",.{count});
    try expect(count == 9);
}


