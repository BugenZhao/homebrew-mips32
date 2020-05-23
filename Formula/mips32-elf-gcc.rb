class Mips32ElfGcc < Formula

  desc "GNU compiler collection for mips32-elf development"
  homepage "https://gcc.gnu.org"
  url "https://ftp.gnu.org/gnu/gcc/gcc-10.1.0/gcc-10.1.0.tar.xz"
  mirror "https://mirror.clarkson.edu/gnu/gcc/gcc-10.1.0/gcc-10.1.0.tar.xz" 
  sha256 "b6898a23844b656f1b68691c5c012036c2e694ac4b53a8918d4712ad876e7ea2"

  depends_on "gmp"
  depends_on "libmpc"
  depends_on "mpfr"
  depends_on "gnu-sed"
  depends_on "mips32-elf-binutils"

  def install
    languages = %w[c]

    binutils = Formulary.factory "mips32-elf-binutils"

    args = [
      "--prefix=#{prefix}",
      "--enable-languages=#{languages.join(",")}",
      "--disable-werror",
      "--disable-nls",
      "--disable-libssp",
      "--disable-threads",
      "--disable-shared",
      "--disable-libstdcxx-pch",
      "--disable-libgomp",
      "--disable-libmudflap",
      "--disable-multilib",
      "--with-as=#{binutils.bin}/mips32-elf-as",
      "--with-ld=#{binutils.bin}/mips32-elf-ld",
      "--without-headers",
      "--without-isl",
      "--target=mips32-elf"
    ]

    mkdir "build" do
      system "../configure", *args
      system "make", "all-gcc"
      system "make", "install-gcc"
      system "make", "all-target-libgcc"
      system "make", "install-target-libgcc"
    end

    # info and man7 files conflict with native gcc
    info.rmtree
    man7.rmtree
  end
end
