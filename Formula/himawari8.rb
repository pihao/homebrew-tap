# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Himawari8 < Formula
  desc "Himawari8 wallpaper for MacOS"
  homepage "https://himawari.asia"
  url "https://github.com/pihao/himawari8/archive/refs/tags/0.0.3.tar.gz"
  sha256 "72402042a20b9f1a9f52f83a65d311a099790a3c070a289c575f3c4c1bcf86bf"
  version "0.0.3-11"
  license "BSD-3-Clause"

  depends_on "go" => :build

  def install
    system "make", "build_brew"
    bin.install "himawari8"
    system "mkdir", "-p", var/"run/himawari8", var/"log/himawari8"
  end

  service do
    run [opt_bin/"himawari8", "-stderrthreshold=INFO", "-logtostderr=true"]
    working_dir var/"run/himawari8"
    log_path var/"log/himawari8/std.log"
    error_log_path var/"log/himawari8/error.log"
    keep_alive true
  end

  test do
    system "himawari8", "-version"
  end
end
