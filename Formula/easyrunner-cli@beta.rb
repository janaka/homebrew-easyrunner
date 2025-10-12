class EasyrunnerCliATBeta < Formula
  include Language::Python::Virtualenv

  desc "Beta builds of EasyRunner CLI - Single server self-hosting PaaS"
  homepage "https://github.com/janaka/easyrunner"
  url "https://github.com/janaka/easyrunner/releases/download/v0.0.7b0/easyrunner_cli-0.0.7b0-py3-none-any.whl"
  sha256 "38e6f1297cc2f9766823c69ebfcbcf4474957717bc893b9064cd50d75d20bed1"
  version "0.0.7b0"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"er", "--version"
  end
end
