class EasyrunnerCliATBeta < Formula
  include Language::Python::Virtualenv

  desc "Beta builds of EasyRunner CLI - Single server self-hosting PaaS"
  homepage "https://github.com/janaka/easyrunner"
  url "https://github.com/janaka/easyrunner/releases/download/v0.0.1-beta/easyrunner_cli-0.0.1-beta-py3-none-any.whl"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  version "0.0.1-beta"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"er", "--version"
  end
end
