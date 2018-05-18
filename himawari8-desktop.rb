class Himawari8Desktop < Formula
  desc "Cool wallpaper."
  homepage "https://github.com/pihao/himawari8-desktop"
  url "https://github.com/pihao/himawari8-desktop/releases/download/0.0.2/himawari8-desktop-0.0.2.tar.gz"
  sha256 "df13cd9dc523580d9f40a6c0c143cf12dea798e0f55b7700f129c5cf121962c2"
  version "0.0.2"

  def install
    bin.install "himawari8-desktop"
  end
end
