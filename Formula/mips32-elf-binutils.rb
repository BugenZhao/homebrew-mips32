class Mips32ElfBinutils < Formula

  desc "FSF Binutils for mips32-elf cross development"
  homepage "https://www.gnu.org/software/binutils/binutils.html"
  url "https://ftp.gnu.org/gnu/binutils/binutils-2.34.tar.xz"
  mirror "https://ftpmirror.gnu.org/binutils/binutils-2.34.tar.xz" 
  sha256 "f00b0e8803dc9bab1e2165bd568528135be734df3fabf8d0161828cd56028952"

  def install
    args = [
      "--prefix=#{prefix}",
      "--disable-multilib",
      "--disable-werror",
      "--disable-nls",
      "--target=mips32-elf"
    ]

    system "./configure", *args
    system "make"
    system "make", "install"

    info.rmtree
  end
end
