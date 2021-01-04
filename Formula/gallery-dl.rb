class GalleryDl < Formula
  include Language::Python::Virtualenv

  desc "Command-line program to download image galleries and collections from several image hosting sites"
  homepage "https://github.com/mikf/gallery-dl"
  url "https://github.com/mikf/gallery-dl/archive/v1.16.1.tar.gz"
  sha256 "ab3ba8e84366e54944673a2a1cfeb05eea16da2f27ff0bb6067fe055e01db283"
  head "https://github.com/mikf/gallery-dl.git"
  license "GPL-2.0"

  livecheck do
    url "https://github.com/mikf/gallery-dl/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  bottle do
    cellar :any_skip_relocation
    sha256 "9efe9b88dd4999412396bde9543b65152fcf5e75b25307b39826c8b3149369ce" => :catalina
    sha256 "a31510083974a5feca324255b43d9f7b2261fb66776a1852e15bc646144dd3b6" => :mojave
    sha256 "44afe4d34e4f6813139128c54b6afe740d03a9753acf8f5e164732e3933e2546" => :high_sierra
  end

  depends_on "python" => :recommended

  def install
    virtualenv_install_with_resources
  end

  test do
    # Test danbooru
    system "#{bin}/gallery-dl", "--simulate", "https://danbooru.donmai.us/posts?tags=bonocho"
  end
end