class EasyrunnerCliBetaAT0340b1 < Formula
  desc "EasyRunner CLI - Beta version"
  homepage "https://easyrunner.xyz"
  url "https://files.pythonhosted.org/packages/bd/7d/b581f2fede3cdc8e0b19b6c95e671546eeda5e36e96277b7c6fc0e9a2601/easyrunner_cli-0.34.0b1-py3-none-any.whl"
  sha256 "8c7137a2517025dfb43aa4d0e22a5d0509e1551517166bd941f5c43f690c85e3"

  depends_on "python@3.12"

  def install
    # Create a virtual environment and install the package with all dependencies
    python_version = "3.12"
    python = Formula["python@#{python_version}"].opt_bin/"python#{python_version}"
    venv = libexec/"venv"
    system python, "-m", "venv", venv
    pip = venv/"bin/pip"
    system pip, "install", "--upgrade", "pip"
    system pip, "install", "--upgrade", "setuptools", "wheel"
    system pip, "install", "easyrunner-cli==0.34.0b1"
    
    # Create wrapper script for the command aliases defined in pyproject.toml (i.e. `er`, `easy`, etc.)
    %w[er easy].each do |cmd|
      bin.install_symlink venv/"bin"/cmd
    end
  end

  test do
    system bin/"er", "--version"
  end
end
