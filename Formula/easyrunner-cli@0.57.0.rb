class EasyrunnerCliAT0570 < Formula
  desc "EasyRunner CLI - Single server self-hosting PaaS"
  homepage "https://easyrunner.xyz"
  url "https://files.pythonhosted.org/packages/65/97/91810c9fe9557fddb21a9983860214fa9f4f3e9fa59a8ada53254d10f30e/easyrunner_cli-0.57.0-py3-none-any.whl"
  sha256 "bcc1c6dccac6b182226aa67dc47005c0f43cff63103369c14efe463a2956ca90"

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
    system pip, "install", "easyrunner-cli==0.57.0"
    
    # Create wrapper script for the command aliases defined in pyproject.toml (i.e. `er`, `easy`, etc.)
    %w[er easy].each do |cmd|
      bin.install_symlink venv/"bin"/cmd
    end
  end

  test do
    system bin/"er", "--version"
  end
end
