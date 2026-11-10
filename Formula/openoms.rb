# Rendered by packaging/homebrew/render.sh on every release and pushed to
# maxkuttner/homebrew-tap as Formula/openoms.rb. Edit the template, not the tap.
class Openoms < Formula
  desc "Order management system: server, web cockpit and CLI in one binary"
  homepage "https://openoms.dev/"

  on_macos do
    on_arm do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.9.0/oms-aarch64-apple-darwin.tar.gz"
      sha256 "652633bb3c12598f30512e46d278e53f8e55540f559536a89fc7ebac0ad962af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.9.0/oms-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "774707cf35dae17e4d260e09eb5af0a84c1551eaf2c924e3cc3e72bd7bcfd692"
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
