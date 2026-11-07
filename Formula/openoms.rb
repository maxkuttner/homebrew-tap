# Rendered by packaging/homebrew/render.sh on every release and pushed to
# maxkuttner/homebrew-tap as Formula/openoms.rb. Edit the template, not the tap.
class Openoms < Formula
  desc "Order management system: server, web cockpit and CLI in one binary"
  homepage "https://openoms.dev/"

  on_macos do
    on_arm do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.7.1/oms-aarch64-apple-darwin.tar.gz"
      sha256 "c88131507fceae859b82173504c7eb88fd0b2224a0aab4909775665f3e5f43f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.7.1/oms-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a7850ea9c7563b20133a486829a48e5475aae32e21f7c87ace7f7552002c22e1"
    end
  end

  def install
    bin.install "oms"
  end

  def caveats
    <<~EOS
      Set up the database and cockpit login, then start the server:
        oms init
        oms
      Guide: https://openoms.dev/getting-started/
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oms --version")
  end
end
