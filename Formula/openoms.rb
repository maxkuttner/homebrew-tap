# Rendered by packaging/homebrew/render.sh on every release and pushed to
# maxkuttner/homebrew-tap as Formula/openoms.rb. Edit the template, not the tap.
class Openoms < Formula
  desc "Order management system: server, web cockpit and CLI in one binary"
  homepage "https://maxkuttner.github.io/openoms/"

  on_macos do
    on_arm do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.6.5/oms-aarch64-apple-darwin.tar.gz"
      sha256 "7e6923b6bfaabbe5a9cc316eb7fc16e7762f69dcdf29a5818a922b121d92c456"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.6.5/oms-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f905827cda556e18e4dc3f8f8bef6f641a73f9c9bb305d427bc646b08c123d69"
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
