# Rendered by packaging/homebrew/render.sh on every release and pushed to
# maxkuttner/homebrew-tap as Formula/openoms.rb. Edit the template, not the tap.
class Openoms < Formula
  desc "Order management system: server, web cockpit and CLI in one binary"
  homepage "https://openoms.dev/"

  on_macos do
    on_arm do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.12.0/oms-aarch64-apple-darwin.tar.gz"
      sha256 "44d68317d37babfa7e6e1ced9d9effbccef57fcce9d5a313a6c0b7ebe63a7dd4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.12.0/oms-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdb6b40b396180905673e11f58dd82e84250ccac369e8a1e23dbdb1406b73814"
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
