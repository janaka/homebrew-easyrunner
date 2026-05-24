class EasyrunnerCliBetaAT0330b1 < Formula
  desc "EasyRunner CLI - Beta version"
  homepage "https://easyrunner.xyz"
  url "https://files.pythonhosted.org/packages/0f/36/c873e1ef750c6c1f222bdf911981c00d82e8133336fb93f1393f826917d0/easyrunner_cli-0.33.0b1-py3-none-any.whl"
  sha256 "480742473b7deea5d687ce73cc99deb25ce49c7286c372caa10cd5edc53e37f8"

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
    system pip, "install", "easyrunner-cli==0.33.0b1"
    
    # Create wrapper script for the command aliases defined in pyproject.toml (i.e. `er`, `easy`, etc.)
    %w[er easy].each do |cmd|
      bin.install_symlink venv/"bin"/cmd
    end
  end

  test do
    system bin/"er", "--version"
  end
end
