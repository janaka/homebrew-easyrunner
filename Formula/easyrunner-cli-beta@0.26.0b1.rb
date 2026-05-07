class EasyrunnerCliBetaAT0260b1 < Formula
  desc "EasyRunner CLI - Beta version"
  homepage "https://easyrunner.xyz"
  url "https://files.pythonhosted.org/packages/a8/87/fd7dfda80140279cb3b420c9851f49dfa46f2626eb44452a9b1051e4d212/easyrunner_cli-0.26.0b1-py3-none-any.whl"
  sha256 "f931cf01fd74c6c12073a120a2f3459332a1ec8e174c1f6d8e3a612ba3bb6a18"

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
    system pip, "install", "easyrunner-cli==0.26.0b1"
    
    # Create wrapper script for the command aliases defined in pyproject.toml (i.e. `er`, `easy`, etc.)
    %w[er easy].each do |cmd|
      bin.install_symlink venv/"bin"/cmd
    end
  end

  test do
    system bin/"er", "--version"
  end
end
