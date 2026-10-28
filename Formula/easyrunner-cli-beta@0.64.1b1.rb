class EasyrunnerCliBetaAT0641b1 < Formula
  desc "EasyRunner CLI - Beta version"
  homepage "https://easyrunner.xyz"
  url "https://files.pythonhosted.org/packages/1b/d2/b4e7c30176a4763ad29df057917d0a5fe24080999d161fff40a29c3aeed8/easyrunner_cli-0.64.1b1-py3-none-any.whl"
  sha256 "84defd5eb6c1ce7733b012c067004852cf2b2b790b4f21b23a97368ca6d5b018"

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
    system pip, "install", "easyrunner-cli==0.64.1b1"
    
    # Create wrapper script for the command aliases defined in pyproject.toml (i.e. `er`, `easy`, etc.)
    %w[er easy].each do |cmd|
      bin.install_symlink venv/"bin"/cmd
    end
  end

  test do
    system bin/"er", "--version"
  end
end
