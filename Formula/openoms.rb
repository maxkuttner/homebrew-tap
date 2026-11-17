# Rendered by packaging/homebrew/render.sh on every release and pushed to
# maxkuttner/homebrew-tap as Formula/openoms.rb. Edit the template, not the tap.
class Openoms < Formula
  desc "Order management system: server, web cockpit and CLI in one binary"
  homepage "https://openoms.dev/"

  on_macos do
    on_arm do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.11.0/oms-aarch64-apple-darwin.tar.gz"
      sha256 "b7a80e51026e818d1421437e763be4c8ad4c36c7b9f07e626a9b5b0646be4436"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.11.0/oms-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69e2309d613dd245d354d7264d4ed3c4ed7e1b83ea60502f4ed1dec10fb71e14"
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
