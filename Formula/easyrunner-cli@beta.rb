class EasyrunnerCliATBeta < Formula
  include Language::Python::Virtualenv

  desc "Beta builds of EasyRunner CLI - Single server self-hosting PaaS"
  homepage "https://github.com/janaka/easyrunner"
  url "https://github.com/janaka/easyrunner/releases/download/v0.0.5b0/easyrunner_cli-0.0.5b0-py3-none-any.whl"
  sha256 "045ebd93ac5479f827240136b56c81900ee496cdf3d3f106797aec4f7bdd8d3d"
  version "0.0.5b0"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"er", "--version"
  end
end
