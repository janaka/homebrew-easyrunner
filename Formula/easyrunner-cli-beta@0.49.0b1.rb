class EasyrunnerCliBetaAT0490b1 < Formula
  desc "EasyRunner CLI - Beta version"
  homepage "https://easyrunner.xyz"
  url "https://files.pythonhosted.org/packages/98/d2/7aa337d6e23ab6f1de259e1bb9d8c314166c47ba3977c50ab6bfc9cf402f/easyrunner_cli-0.49.0b1-py3-none-any.whl"
  sha256 "dbfea3ec27d83ece95d35760e374ee49d1281fb42bfc0f43673e0da49973d5f6"

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
    system pip, "install", "easyrunner-cli==0.49.0b1"
    
    # Create wrapper script for the command aliases defined in pyproject.toml (i.e. `er`, `easy`, etc.)
    %w[er easy].each do |cmd|
      bin.install_symlink venv/"bin"/cmd
    end
  end

  test do
    system bin/"er", "--version"
  end
end
