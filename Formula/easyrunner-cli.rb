class EasyrunnerCli < Formula
  include Language::Python::Virtualenv

  desc "EasyRunner CLI - Single server self-hosting PaaS"
  homepage "https://github.com/janaka/easyrunner"
  url "https://github.com/janaka/easyrunner/releases/download/v0.0.6/easyrunner_cli-0.0.6-py3-none-any.whl"
  sha256 "2fde661ab48bad299ef5ea02835c3e6c8f349e961fc8bfe22c5bc873f39bc623"
  version "0.0.6"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"er", "--version"
  end
end
