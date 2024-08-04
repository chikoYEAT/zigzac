// var y: i32 = add(10, x);
// const x: i32 = add(12, 34);

// test "container level variables" {
//     try expect(x == 46);
//     try expect(y == 56);
// }

// fn add(a: i32, b: i32) i32 {
//     return a + b;
// }

// const std = @import("std");
// const expect = std.testing.expect;

const std = @import("std");
const expect = std.testing.expect;

test "namespaced container level variable" {
    try expect(foo() == 1235);
    try expect(foo() == 1236);
}

const S = struct {
    var x: i32 = 1234;
};

fn foo() i32 {
    S.x += 1;
    return S.x;
}
