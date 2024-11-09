const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const out_exe = b.addExecutable(.{
        .name = "nixos-cli",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const out_tests = b.addTest(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const cmd_exe = b.addRunArtifact(out_exe);
    const cmd_test = b.addRunArtifact(out_tests);

    if (b.args) |args| {
        cmd_exe.addArgs(args);
    }

    b.step("run", "Run the app")
        .dependOn(&cmd_exe.step);

    b.step("test", "Run unit tests")
        .dependOn(&cmd_test.step);

    b.installArtifact(out_exe);
}
