# Rendered by packaging/homebrew/render.sh on every release and pushed to
# maxkuttner/homebrew-tap as Formula/openoms.rb. Edit the template, not the tap.
class Openoms < Formula
  desc "Order management system: server, web cockpit and CLI in one binary"
  homepage "https://maxkuttner.github.io/openoms/"

  on_macos do
    on_arm do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.7.0/oms-aarch64-apple-darwin.tar.gz"
      sha256 "a9250c97c931e1d3d30ff8a3c067498e1d913169272d8e66891d69c09b259741"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.7.0/oms-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b09ef03f5b18bd8e94eb538a97638151458296df5cdd7d79a7d7c4a74c1f2326"
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
      Guide: https://maxkuttner.github.io/openoms/getting-started/
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oms --version")
  end
end
