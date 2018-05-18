class Himawari8Desktop < Formula
  desc "Cool wallpaper."
  homepage "https://himawari8.nict.go.jp/"
  url "https://github.com/pihao/himawari8-desktop/releases/download/0.0.2/himawari8-desktop-0.0.2.tar.gz"
  sha256 "060ae3f9fccd1cf3667506ce8e04e0719a314a04e6e19822b93c35409c089bab"
  version "0.0.2"

  def install
    bin.install "himawari8-desktop"
  end
end
