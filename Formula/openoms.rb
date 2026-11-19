# Rendered by packaging/homebrew/render.sh on every release and pushed to
# maxkuttner/homebrew-tap as Formula/openoms.rb. Edit the template, not the tap.
class Openoms < Formula
  desc "Order management system: server, web cockpit and CLI in one binary"
  homepage "https://openoms.dev/"

  on_macos do
    on_arm do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.14.0/oms-aarch64-apple-darwin.tar.gz"
      sha256 "90686bfd0e7f1cae3cff5ad2397e0ada193a5dbd63350503d7ee11d2b8ca44b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.14.0/oms-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1508dcfdcfbf4b314f9c45fbb2a3f1d5142af1e68f5a7cb77783a6e3ec18a889"
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
