class EasyrunnerCliBeta < Formula
  desc "EasyRunner CLI - Beta version"
  homepage "https://easyrunner.xyz"
  url "https://files.pythonhosted.org/packages/py3/e/easyrunner-cli/easyrunner_cli-0.0.8b0-py3-none-any.whl"
  sha256 "f44cec2ad97b9a46b255553a6e56e62b5b84514c70d325df73e38f94c435b97c"

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
    system pip, "install", "easyrunner-cli==0.0.8b0"
    
    # Create wrapper script for the er command
    bin.install_symlink venv/"bin/er"
  end

  test do
    system bin/"er", "--version"
  end
end
