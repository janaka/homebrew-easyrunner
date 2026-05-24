class EasyrunnerCliBetaAT0304b1 < Formula
  desc "EasyRunner CLI - Beta version"
  homepage "https://easyrunner.xyz"
  url "https://files.pythonhosted.org/packages/97/7b/901291e026bc7a7f151213ef8e7c55f76d25afd95523c3ae03e0df00dbd8/easyrunner_cli-0.30.4b1-py3-none-any.whl"
  sha256 "35de73f697f617be6a9806ed1c83593308d31dec0b2c8f3f141fde30481c057d"

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
    system pip, "install", "easyrunner-cli==0.30.4b1"
    
    # Create wrapper script for the command aliases defined in pyproject.toml (i.e. `er`, `easy`, etc.)
    %w[er easy].each do |cmd|
      bin.install_symlink venv/"bin"/cmd
    end
  end

  test do
    system bin/"er", "--version"
  end
end
