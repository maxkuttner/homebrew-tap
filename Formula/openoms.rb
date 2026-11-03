# Rendered by packaging/homebrew/render.sh on every release and pushed to
# maxkuttner/homebrew-tap as Formula/openoms.rb. Edit the template, not the tap.
class Openoms < Formula
  desc "Order management system: server, web cockpit and CLI in one binary"
  homepage "https://maxkuttner.github.io/openoms/"

  on_macos do
    on_arm do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.6.4/oms-aarch64-apple-darwin.tar.gz"
      sha256 "ca25d724d3e22e95284b005b69a9b73e073a3ab60770b0ea5665376a83465d7a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.6.4/oms-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c7def45bb9ff44d0235a803aed1ec604c159846e6d969bb3b9bb7d4026f2232"
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
