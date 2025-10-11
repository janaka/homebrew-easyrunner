class EasyrunnerCliATBeta < Formula
  include Language::Python::Virtualenv

  desc "Beta builds of EasyRunner CLI - Single server self-hosting PaaS"
  homepage "https://github.com/janaka/easyrunner"
  url "https://github.com/janaka/easyrunner/releases/download/v0.0.6b0/easyrunner_cli-0.0.6b0-py3-none-any.whl"
  sha256 "144eefd3361f6d0aa8ff047bc2be98d9546fbe1e08db5f5925333f995df5a07f"
  version "0.0.6b0"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"er", "--version"
  end
end
