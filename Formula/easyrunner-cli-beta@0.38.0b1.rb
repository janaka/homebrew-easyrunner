class EasyrunnerCliBetaAT0380b1 < Formula
  desc "EasyRunner CLI - Beta version"
  homepage "https://easyrunner.xyz"
  url "https://files.pythonhosted.org/packages/02/bf/f799a259490584b2962a17f76b725c1ef707a22c680f7580d991c07475e2/easyrunner_cli-0.38.0b1-py3-none-any.whl"
  sha256 "a3d5355cf324dd18fb15bc39adfd487e9102d3b6dce63e2bbb76717573770bf6"

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
    system pip, "install", "easyrunner-cli==0.38.0b1"
    
    # Create wrapper script for the command aliases defined in pyproject.toml (i.e. `er`, `easy`, etc.)
    %w[er easy].each do |cmd|
      bin.install_symlink venv/"bin"/cmd
    end
  end

  test do
    system bin/"er", "--version"
  end
end
