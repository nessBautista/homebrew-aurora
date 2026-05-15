class Aurora < Formula
  desc "Hello-world demo of the Aurora dev cycle"
  homepage "https://github.com/nessBautista/aurora"
  head "https://github.com/nessBautista/aurora", branch: "main", using: :git
  version "0.0.1-dev"

  depends_on "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/aurora"
  end

  test do
    assert_match "Hello, brew!", shell_output("#{bin}/aurora hello brew")
  end
end
