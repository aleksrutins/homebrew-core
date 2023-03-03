class BashUnit < Formula
  desc "Bash unit testing enterprise edition framework for professionals"
  homepage "https://github.com/pgrange/bash_unit"
  url "https://github.com/pgrange/bash_unit/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "51b2c9c906c414efb403b6fbf02cfb77d97b442043b29e39c1d6fddc8806972f"
  license "GPL-3.0-only"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "da98c4c38b17e2f14fc3ad20867f72095271f44e8aefdb39f3d7e66e169dcd65"
  end

  uses_from_macos "bc" => :test

  def install
    bin.install "bash_unit"
    man1.install "docs/man/man1/bash_unit.1"
  end

  test do
    (testpath/"test.sh").write <<~EOS
      test_addition() {
        RES="$(echo 2+2 | bc)"
        assert_equals "${RES}" "4"
      }
    EOS
    assert "addition", shell_output("#{bin}/bash_unit test.sh")
  end
end
