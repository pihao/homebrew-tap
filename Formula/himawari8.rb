# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Himawari8 < Formula
  desc "Himawari8 wallpaper for MacOS"
  homepage "https://himawari.asia"
  url "https://github.com/pihao/himawari8/archive/refs/tags/0.0.3.tar.gz"
  sha256 "466fd130a0b5486fc0def35b76523e951c0adb0f1cb1c020a831fcfa0d6c61e8"
  version "0.0.3-10"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/pihao/homebrew-tap/releases/download/himawari8-0.0.3"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "b8194d1ab1d0a8f35488b33a3ff9934aab69f899cc9ebf64edf9d50a5726a2fb"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "b8194d1ab1d0a8f35488b33a3ff9934aab69f899cc9ebf64edf9d50a5726a2fb"
    sha256 cellar: :any_skip_relocation, monterey:       "426d2957327ff3f232344626774a5bd4aea420064089c45e4e376991bb431c37"
    sha256 cellar: :any_skip_relocation, big_sur:        "426d2957327ff3f232344626774a5bd4aea420064089c45e4e376991bb431c37"
  end

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
