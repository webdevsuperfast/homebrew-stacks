class GalleryDl < Formula
  include Language::Python::Virtualenv

  desc "Command-line program to download image-galleries and -collections from several image hosting sites"
  homepage "https://github.com/mikf/gallery-dl"
  url "https://github.com/mikf/gallery-dl/archive/v1.10.4.tar.gz"
  sha256 "1d45950751f52d8ec8e8e64dc4834e260118ee6d9cf23d87bf21b92128ca3d30"
  head "https://github.com/mikf/gallery-dl.git"

  depends_on "python" => :recommended

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/60/75/f692a584e85b7eaba0e03827b3d51f45f571c2e793dd731e598828d380aa/certifi-2019.3.9-py2.py3-none-any.whl#sha256=59b7658e26ca9c7339e00f8f4636cdfe59d34fa37b9b04f6f9e9926b3cece1a5"
    sha256 "59b7658e26ca9c7339e00f8f4636cdfe59d34fa37b9b04f6f9e9926b3cece1a5"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/bc/a9/01ffebfb562e4274b6487b4bb1ddec7ca55ec7510b22e4c51f14098443b8/chardet-3.0.4-py2.py3-none-any.whl#sha256=fc323ffcaeaed0e0a02bf4d117757b98aed530d9ed4531e3e15460124c106691"
    sha256 "fc323ffcaeaed0e0a02bf4d117757b98aed530d9ed4531e3e15460124c106691"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/14/2c/cd551d81dbe15200be1cf41cd03869a46fe7226e7450af7a6545bfc474c9/idna-2.8-py2.py3-none-any.whl#sha256=ea8b7f6188e6fa117537c3df7da9fc686d485087abf6ac197f9c46432f7e4a3c"
    sha256 "ea8b7f6188e6fa117537c3df7da9fc686d485087abf6ac197f9c46432f7e4a3c"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/62/00/ee1d7de624db8ba7090d1226aebefab96a2c71cd5cfa7629d6ad3f61b79e/urllib3-1.24.1-py2.py3-none-any.whl#sha256=61bf29cada3fc2fbefad4fdf059ea4bd1b4a86d2b6d15e1c7c0b582b9752fe39"
    sha256 "61bf29cada3fc2fbefad4fdf059ea4bd1b4a86d2b6d15e1c7c0b582b9752fe39"
  end

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
                              "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", "gallery-dl"
    venv.pip_install_and_link buildpath
  end
end