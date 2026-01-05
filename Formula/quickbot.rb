class Quickbot < Formula
  desc "Quick-Bot CLI - Automation & plugin management"
  homepage "https://github.com/levinismynameirl/Quick-Bot"
  url "https://github.com/levinismynameirl/Quick-Bot/archive/refs/tags/v1.0.1.1.tar.gz"
  sha256 "893f13f31767bd80de21f93d8c10ae6657d582ec295589fa4662e928d6c89938"
  license "MIT"

  def install
    # Install everything into the prefix directory
    prefix.install Dir["*"]

    # Make install.sh executable
    chmod "+x", "#{prefix}/install.sh"

    # Optionally, run the install.sh to finish installation
    system "#{prefix}/install.sh"

    # Symlink quick command into Homebrew bin
    bin.install "#{prefix}/quick" => "quick"
  end

  test do
    # Basic sanity check
    assert_match "Quick-Bot", shell_output("#{bin}/quick --version")
  end
end