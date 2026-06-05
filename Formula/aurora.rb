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

  def caveats
    <<~EOS
      Aurora talks to an LLM provider — Anthropic or OpenRouter. To get started:

        1. Store a key (saved to the macOS keychain, Touch ID protected):
             aurora auth set anthropic        # or: openrouter
        2. Pick the default provider:
             aurora auth use anthropic        # or: openrouter
        3. Chat:
             aurora chat "hello"

      `aurora chat` has no default provider — you must select one first.
      Override per call with `--provider <name>` or the `LLM_PROVIDER` env var.
    EOS
  end

  test do
    assert_match "Hello, brew!", shell_output("#{bin}/aurora hello brew")
  end
end
