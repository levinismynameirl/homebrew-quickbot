class Quickbot < Formula
  desc "QuickBot - your macOS command-line assistant"
  homepage "https://github.com/levinismynameirl/Quick-Bot"
  url "https://github.com/levinismynameirl/Quick-Bot/archive/refs/tags/v0.1.0d.tar.gz"
  # TODO: Update sha256 after publishing the v0.1.0d release
  sha256 "893f13f31767bd80de21f93d8c10ae6657d582ec295589fa4662e928d6c89938"
  license "GPL-3.0"

  depends_on "python@3.11"
  depends_on "pipx"

  def install
    prefix.install Dir["*"]
  end

  def post_install
    # Install QuickBot via pipx from the prefix
    system "pipx", "install", prefix.to_s, "--force"
  end

  def caveats
    <<~EOS
      ⚠  QuickBot v0.1.0d — Development Beta

      This is the first public release of QuickBot and is a development
      build. Features may be incomplete, config file formats may change
      between releases, and things may break.

      Back up ~/.config/.quickbot/data/ before updating.
      Report issues: https://github.com/levinismynameirl/Quick-Bot/issues

      Usage:
        quick --help
        quick doctor
    EOS
  end

  test do
    system "quick", "--version"
  end
end