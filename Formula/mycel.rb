class Mycel < Formula
  desc "Declarative microservice runtime: describe what connects to what, and it runs the service"
  homepage "https://github.com/matutetandil/mycel"
  url "https://github.com/matutetandil/mycel/archive/refs/tags/v3.2.2.tar.gz"
  sha256 "eda6554f70068f27cd2be2f7f10008acea1e2ff03e4e432a4b7402a490d0c11d"
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
