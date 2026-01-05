class Quickbot < Formula
  desc "QuickBot CLI - plugin-enabled automation tool"
  homepage "https://github.com/levinismynameirl/Quick-Bot"
  url "https://github.com/levinismynameirl/Quick-Bot/archive/refs/tags/v1.0.1.1.tar.gz"
  sha256 "893f13f31767bd80de21f93d8c10ae6657d582ec295589fa4662e928d6c89938"
  license "MIT"

  depends_on "python@3.11"

  def install
    prefix.install Dir["*"]
    bin.install "install.sh" => "quick"
  end

  def caveats
    <<~EOS
      QuickBot CLI installed!
      Run: quick --help
      To install plugins: quick plugin --install <plugin>
    EOS
  end
end