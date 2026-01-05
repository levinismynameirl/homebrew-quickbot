class QuickBot < Formula
  desc "Quick-Bot CLI – plugin-ready automation tool"
  homepage "https://github.com/levinismynameirl/Quick-Bot"
  url "https://github.com/levinismynameirl/Quick-Bot/archive/refs/tags/v1.0.1.1.tar.gz"
  sha256 "893f13f31767bd80de21f93d8c10ae6657d582ec295589fa4662e928d6c89938"
  license "MIT"

  def install
    # Install all files into the Homebrew prefix
    prefix.install Dir["*"]

    # Make install.sh executable
    chmod "+x", "#{prefix}/install.sh"

    # Optionally symlink main CLI script to Homebrew bin
    bin.install "#{prefix}/quick" => "quick"
  end

  def caveats
    <<~EOS
      Quick-Bot installed via Homebrew.
      To finish setup, run the included install script manually:

        #{prefix}/install.sh

      This will configure Quick-Bot and its default directories.
    EOS
  end

  test do
    # Simple test to check CLI is accessible
    system "#{bin}/quick", "--version"
  end
end