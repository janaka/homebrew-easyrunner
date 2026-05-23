class EasyrunnerCliBetaAT0300b1 < Formula
  desc "EasyRunner CLI - Beta version"
  homepage "https://easyrunner.xyz"
  url "https://files.pythonhosted.org/packages/2a/f9/9d3ddcec6b360600676d8896a349a6c8514f559c3c62b384ca714bec0293/easyrunner_cli-0.30.0b1-py3-none-any.whl"
  sha256 "04f3f26d0b69ce9eb251bbc58f964074cdfe76121b9a4680466f4658fec02ce6"

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
    system pip, "install", "easyrunner-cli==0.30.0b1"
    
    # Create wrapper script for the command aliases defined in pyproject.toml (i.e. `er`, `easy`, etc.)
    %w[er easy].each do |cmd|
      bin.install_symlink venv/"bin"/cmd
    end
  end

  test do
    system bin/"er", "--version"
  end
end
