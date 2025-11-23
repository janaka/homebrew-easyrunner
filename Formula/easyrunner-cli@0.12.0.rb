class EasyrunnerCliAT0120 < Formula
  desc "EasyRunner CLI - Single server self-hosting PaaS"
  homepage "https://easyrunner.xyz"
  url "https://files.pythonhosted.org/packages/42/f8/e9c54540205c636df32d3ddc9676a35717005293e8ac287cc79b7e108a9e/easyrunner_cli-0.12.0-py3-none-any.whl"
  sha256 "387f052818b4f27c1fa11508d4cd21d5724fc0246747294b4ee7f6d7ef6e9c36"

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
    system pip, "install", "easyrunner-cli==0.12.0"
    
    # Create wrapper script for the command aliases defined in pyproject.toml (i.e. `er`, `easy`, etc.)
    %w[er easy].each do |cmd|
      bin.install_symlink venv/"bin"/cmd
    end
  end

  test do
    system bin/"er", "--version"
  end
end
