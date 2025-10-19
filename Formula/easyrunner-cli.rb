class EasyrunnerCli < Formula
  desc "EasyRunner CLI"
  homepage "https://easyrunner.xyz"
  url "https://files.pythonhosted.org/packages/py3/e/easyrunner-cli/easyrunner_cli-0.0.7-py3-none-any.whl"
  sha256 "a0ab6a4593913c38a65c023579de7bf96a59c5696ef8dcedd798adf2c1183615"

  depends_on "python@3.13"

  def install
    # Create a virtual environment and install the package with all dependencies
    python_version = "3.13"
    python = Formula["python@#{python_version}"].opt_bin/"python#{python_version}"
    venv = libexec/"venv"
    system python, "-m", "venv", venv
    pip = venv/"bin/pip"
    system pip, "install", "--upgrade", "pip"
    system pip, "install", "--upgrade", "setuptools", "wheel"
    system pip, "install", "easyrunner-cli==0.0.7-py3"
    
    # Create wrapper script for the er command
    bin.install_symlink venv/"bin/er"
  end

  test do
    system bin/"er", "--version"
  end
end
