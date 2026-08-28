class Mycel < Formula
  desc "Declarative microservice runtime: describe what connects to what, and it runs the service"
  homepage "https://github.com/matutetandil/mycel"
  url "https://github.com/matutetandil/mycel/archive/refs/tags/v3.4.0.tar.gz"
  sha256 "d0d523dd0e7cd11b7265591fb17bbf6beff7aa704b149043bdf0461a0b2ead9a"
  license "MIT"
  head "https://github.com/matutetandil/mycel.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/mycel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mycel version")

    # A scaffolded project must validate: the formula is only useful if the
    # binary can actually run a service, not merely report its version.
    system bin/"mycel", "init", testpath/"svc"
    assert_match "Configuration is valid",
                 shell_output("#{bin}/mycel validate --config #{testpath}/svc")
  end
end
