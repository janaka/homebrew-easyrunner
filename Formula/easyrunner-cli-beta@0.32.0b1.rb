class EasyrunnerCliBetaAT0320b1 < Formula
  desc "EasyRunner CLI - Beta version"
  homepage "https://easyrunner.xyz"
  url "https://files.pythonhosted.org/packages/04/a5/e13b7d14cab1dd31f9a46038090c8688e46621a6ca9babbd5ad87def67aa/easyrunner_cli-0.32.0b1-py3-none-any.whl"
  sha256 "5859e78549eaa052f06d374614d87273f05ba0a35b980d44649f23ee96de1fe3"

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
    system pip, "install", "easyrunner-cli==0.32.0b1"
    
    # Create wrapper script for the command aliases defined in pyproject.toml (i.e. `er`, `easy`, etc.)
    %w[er easy].each do |cmd|
      bin.install_symlink venv/"bin"/cmd
    end
  end

  test do
    system bin/"er", "--version"
  end
end
