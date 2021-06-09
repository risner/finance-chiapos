--- setup.py.orig	2021-05-28 02:40:44 UTC
+++ setup.py
@@ -9,13 +9,6 @@ from setuptools import setup, setuptools, Extension
 from setuptools.command.build_ext import build_ext
 from distutils.version import LooseVersion

-
-class CMakeExtension(Extension):
-    def __init__(self, name, sourcedir=""):
-        Extension.__init__(self, name, sources=["./"])
-        self.sourcedir = os.path.abspath(sourcedir)
-
-
 class CMakeBuild(build_ext):
     def run(self):
         try:
@@ -202,6 +195,7 @@ if platform.system() == "Windows":
 else:
     setup(
         name="chiapos",
+        version="1.0.3",
         author="Mariano Sorgente",
         author_email="mariano@chia.net",
         description="Chia proof of space plotting, proving, and verifying (wraps C++)",
@@ -209,8 +203,7 @@ else:
         python_requires=">=3.7",
         long_description=open("README.md").read(),
         long_description_content_type="text/markdown",
-        url="https://github.com/Chia-Network/chiavdf",
-        ext_modules=[CMakeExtension("chiapos", ".")],
+        url="https://github.com/Chia-Network/chiapos",
         cmdclass=dict(build_ext=CMakeBuild),
         zip_safe=False,
     )
