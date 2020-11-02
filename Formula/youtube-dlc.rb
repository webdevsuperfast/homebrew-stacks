class YoutubeDlc < Formula
  include Language::Python::Virtualenv

  desc "Media downloader for various sites"
  homepage "https://github.com/blackjack4494/yt-dlc"
  url "https://github.com/blackjack4494/yt-dlc/archive/2020.10.31.tar.gz"
  sha256 "0d23cc2e2f1cc7291e5d2a468b1cd282a6be228a215df188aaecae8951ac64d9"
  license "Unlicense"
  head "https://github.com/blackjack4494/yt-dlc.git"

  livecheck do
    url "https://github.com/blackjack4494/yt-dlc/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  bottle do
    cellar :any_skip_relocation
    sha256 "9efe9b88dd4999412396bde9543b65152fcf5e75b25307b39826c8b3149369ce" => :catalina
    sha256 "a31510083974a5feca324255b43d9f7b2261fb66776a1852e15bc646144dd3b6" => :mojave
    sha256 "44afe4d34e4f6813139128c54b6afe740d03a9753acf8f5e164732e3933e2546" => :high_sierra
  end

  depends_on "python@3.9"

  def install
    virtualenv_install_with_resources
  end

  test do
    # commit history of homebrew-core repo
    system "#{bin}/youtube-dlc", "--simulate", "https://www.youtube.com/watch?v=pOtd1cbOP7k"
    # homebrew playlist
    system "#{bin}/youtube-dlc", "--simulate", "--yes-playlist", "https://www.youtube.com/watch?v=pOtd1cbOP7k&list=PLMsZ739TZDoLj9u_nob8jBKSC-mZb0Nhj"
  end
end
