# Rendered by packaging/homebrew/render.sh on every release and pushed to
# maxkuttner/homebrew-tap as Formula/openoms.rb. Edit the template, not the tap.
class Openoms < Formula
  desc "Order management system: server, web cockpit and CLI in one binary"
  homepage "https://maxkuttner.github.io/openoms/"

  on_macos do
    on_arm do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.6.2/oms-aarch64-apple-darwin.tar.gz"
      sha256 "4c12b5de7d80e68c6c1490ffda94421674929e5bf544caa25b970840ea15e1cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.6.2/oms-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6dbb308f03caa68e9d72f9b7e01072a9e7a2b79b0c5c594f2737692eb423f06"
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
