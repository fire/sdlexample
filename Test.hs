module Main where

import Graphics.UI.SDL.Video
import Graphics.UI.SDL.General
import Graphics.UI.SDL.Types
import Graphics.UI.SDL.Events
import Graphics.UI.SDL.Time


import Foreign
import Data.Typeable
import Data.Char

import System.Environment
import System.Exit
import System.Random

width = 640
height = 480
posWidth = 100
posHeight = 100

main = withInit [InitVideo] $ 
    do window <- createWindow "Test" (Position posWidth posHeight) (Size width height) [WindowOpengl]
       render <- createRenderer window FirstSupported [Software, PresentVSync] 
       image <- loadBMP "image.bmp"
       texture <- createTextureFromSurface render image
       renderClear render
       renderCopy render texture Nothing Nothing
       renderPresent render
       delay 2000
