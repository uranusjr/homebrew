require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Mono < Formula
  homepage 'http://www.mono-project.com/Main_Page'
  url 'http://download.mono-project.com/sources/mono/mono-3.0.2.tar.bz2'
  version '3.0.2'
  sha1 '165aa3f21189b83923fdf84400b527c7c4c4545a'

  # depends_on 'cmake' => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    system "./configure", "--with-glib=embedded", "--enable-nls=no",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make"
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    system "gmcs", "--about"
    system "mono", "--version"
  end
end
