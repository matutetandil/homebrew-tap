class Mycel < Formula
  desc "Declarative microservice runtime: describe what connects to what, and it runs the service"
  homepage "https://github.com/matutetandil/mycel"
  url "https://github.com/matutetandil/mycel/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "4f3e5abad9ad999e99c57d00d1e1673f784fe211d0682e33ceab19505343ffdf"
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
