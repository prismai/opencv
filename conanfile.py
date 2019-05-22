from conans import ConanFile, CMake, tools
from conans.model.version import Version
from conans.errors import ConanInvalidConfiguration
import os

class OpencvConan(ConanFile):
    name = "opencv"
    version = "4.1.0"
    settings = "os"

    def package(self):
        self.copy("*")

    def package_info(self):
        self.cpp_info.libs = tools.collect_libs(self)
        self.cpp_info.includedirs.append(os.path.join('include', 'opencv4'))
        self.cpp_info.libdirs.append(os.path.join('lib', 'opencv4', '3rdparty'))
