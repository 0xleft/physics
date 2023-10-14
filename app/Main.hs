module Main (main) where

import Lib (calcUarmOverTime, calcUarm)

main :: IO ()
-- ask for input
main = do
    putStrLn "Step: "
    stepStr <- getLine
    let step = read stepStr :: Double
    putStrLn "Init angle: "
    initAngleStr <- getLine
    let initAngle = read initAngleStr :: Double
    putStrLn "Init velocity:"
    initVelocityStr <- getLine
    let initVelocity = read initVelocityStr :: Double
    putStrLn "Init height: "
    initHeightStr <- getLine
    let initHeight = read initHeightStr :: Double
    putStrLn "Init time: "
    initTimeStr <- getLine
    let initTime = read initTimeStr :: Double
    calcUarmOverTime step initAngle initVelocity initHeight initTime