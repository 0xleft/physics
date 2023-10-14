module Lib(calcUarm, calcUarmOverTime) where
import Text.Printf (printf)
import Control.Monad (unless)
import Control.Exception (handle)
import System.IO (openFile, hGetContents, hClose, IOMode(ReadMode, ReadWriteMode, WriteMode), hPutStrLn)
import Data.List.Split
import GHC.IO.Handle.Types (HandleType(ReadWriteHandle))

g :: Double
g = 9.81

calcUarm :: Double -> Double -> Double -> Double -> Double
calcUarm init_angle init_velocity init_height time = do
    let y = -(g/(2*(init_velocity**2 * cos init_angle ** 2))) * time**2 + (tan init_angle * time) + init_height
    y

calcUarmOverTime :: Double -> Double -> Double -> Double -> Double -> IO ()
calcUarmOverTime step init_angle init_velocity init_height time = do
    let y = calcUarm init_angle init_velocity init_height time
    -- printf "x: %.2f y: %.2f\n" time y
    -- printf "%.2f\n" init_angle

    graphUarmToTime time y
    unless (y <= 0) $ calcUarmOverTime step init_angle init_velocity init_height (time + step)

graphUarmToTime :: Double -> Double -> IO ()
graphUarmToTime x y = do
    let new_line = replicate (round y) ' ' ++ "o"

    print new_line