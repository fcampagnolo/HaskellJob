module Paths_T4 (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/fernando/.cabal/bin"
libdir     = "/home/fernando/.cabal/lib/T4-0.1/ghc-7.4.1"
datadir    = "/home/fernando/.cabal/share/T4-0.1"
libexecdir = "/home/fernando/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "T4_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "T4_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "T4_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "T4_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
