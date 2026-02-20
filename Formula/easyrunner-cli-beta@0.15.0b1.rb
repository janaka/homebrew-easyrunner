class EasyrunnerCliBetaAT0150b1 < Formula
  desc "EasyRunner CLI - Beta version"
  homepage "https://easyrunner.xyz"
  url "https://files.pythonhosted.org/packages/c2/38/7f8241ad8ebfb53ef20fa6e07a98c31b611cf7b7a48445853fd2d6b6d2d1/easyrunner_cli-0.15.0b1-py3-none-any.whl"
  sha256 "006ca3ce09c994ff75585c7fd276a419a1ac69c7d681fc6fd97b6da583b9e537"

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
    system pip, "install", "easyrunner-cli==0.15.0b1"
    
    # Create wrapper script for the command aliases defined in pyproject.toml (i.e. `er`, `easy`, etc.)
    %w[er easy].each do |cmd|
      bin.install_symlink venv/"bin"/cmd
    end
  end

  test do
    system bin/"er", "--version"
  end
end
